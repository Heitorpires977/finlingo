import { useLessons } from '@/hooks/useGameData';
import { useNavigate } from 'react-router-dom';
import { CheckCircle, Lock, Star, Zap, Target } from 'lucide-react';
import AppLayout from '@/components/AppLayout';
import { allModules } from '@/data/lessons';
import { useMemo } from 'react';

const SECTION_COLORS = ['bg-primary', 'bg-secondary'];
const SECTION_ICONS = ['💰', '📊'];

function getDayOfYear() {
  const now = new Date();
  const start = new Date(now.getFullYear(), 0, 0);
  const diff = now.getTime() - start.getTime();
  return Math.floor(diff / (1000 * 60 * 60 * 24));
}

export default function LearnPage() {
  const { data: lessons, isLoading } = useLessons();
  const navigate = useNavigate();

  const moduleSlugMap = useMemo(() => {
    const map = new Map<string, string>();
    allModules.forEach(m => {
      m.lessons.forEach(l => {
        const match = l.title.match(/^(\d+\.\d+)/);
        if (match) map.set(match[1], l.slug);
      });
    });
    return map;
  }, []);

  if (isLoading) {
    return (
      <AppLayout>
        <div className="flex items-center justify-center h-64">
          <div className="animate-pulse text-muted-foreground">Carregando...</div>
        </div>
      </AppLayout>
    );
  }

  const completedIds = new Set<number>();
  
  const sections = new Map<number, { title: string; lessons: typeof lessons }>();

  lessons?.forEach(l => {
    if (!sections.has(l.section_id)) {
      sections.set(l.section_id, { title: l.section_title, lessons: [] });
    }
    sections.get(l.section_id)!.lessons!.push(l);
  });

  const isLessonUnlocked = (sectionId: number, lessonNumber: number) => {
    if (sectionId === 1 && lessonNumber === 1) return true;
    const sectionLessons = lessons?.filter(l => l.section_id === sectionId) ?? [];
    const prevLesson = sectionLessons.find(l => l.lesson_number === lessonNumber - 1);
    if (prevLesson && completedIds.has(prevLesson.id)) return true;
    if (lessonNumber === 1 && sectionId > 1) {
      const prevSectionLessons = lessons?.filter(l => l.section_id === sectionId - 1) ?? [];
      const lastLesson = prevSectionLessons[prevSectionLessons.length - 1];
      if (lastLesson && completedIds.has(lastLesson.id)) return true;
    }
    return false;
  };

  const handleLessonClick = (lesson: any, unlocked: boolean) => {
    if (!unlocked) return;
    const match = lesson.title.match(/^(\d+\.\d+)/);
    const slug = match ? moduleSlugMap.get(match[1]) : null;
    if (slug) {
      navigate(`/modulo/${slug}`);
    } else {
      navigate(`/lesson/${lesson.id}`);
    }
  };

  return (
    <AppLayout>
      <div className="space-y-6">
        {Array.from(sections.entries()).map(([sectionId, section], idx) => (
          <div key={sectionId} className="space-y-3">
            <div className="flex items-center gap-3">
              <div className={`w-10 h-10 rounded-xl ${SECTION_COLORS[idx % 2]} flex items-center justify-center text-xl`}>
                {SECTION_ICONS[idx % 2]}
              </div>
              <div>
                <h2 className="font-bold text-foreground">Seção {sectionId}</h2>
                <p className="text-xs text-muted-foreground">{section.title}</p>
              </div>
            </div>

            <div className="flex flex-col gap-2">
              {section.lessons?.map((lesson) => {
                const completed = completedIds.has(lesson.id);
                const unlocked = isLessonUnlocked(sectionId, lesson.lesson_number);

                return (
                  <button
                    key={lesson.id}
                    onClick={() => handleLessonClick(lesson, unlocked)}
                    disabled={!unlocked}
                    className={`w-full flex items-center gap-3 p-3 rounded-xl border-2 transition-all ${
                      completed
                        ? 'bg-finlingo-correct/10 border-finlingo-correct'
                        : unlocked
                        ? 'bg-card border-primary/30 hover:border-primary cursor-pointer'
                        : 'bg-muted/50 border-border opacity-60 cursor-not-allowed'
                    }`}
                  >
                    <div className={`w-8 h-8 rounded-lg flex items-center justify-center text-sm font-bold ${
                      completed
                        ? 'bg-finlingo-correct text-primary-foreground'
                        : unlocked
                        ? 'bg-primary text-primary-foreground'
                        : 'bg-muted text-muted-foreground'
                    }`}>
                      {completed ? <CheckCircle className="h-4 w-4" /> : unlocked ? lesson.lesson_number : <Lock className="h-4 w-4" />}
                    </div>
                    <div className="flex-1 text-left">
                      <p className="font-bold text-sm text-foreground">{lesson.title}</p>
                      <p className="text-xs text-muted-foreground">
                        {lesson.is_quiz ? '📝 Quiz' : `📖 ${((lesson.activity_data as unknown[]) || []).length} atividades`} · +{lesson.xp_reward} XP
                      </p>
                    </div>
                  </button>
                );
              })}
            </div>
          </div>
        ))}
      </div>
    </AppLayout>
  );
}