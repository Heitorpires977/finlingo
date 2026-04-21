import { useLessons, useLessonProgress, useProfile } from '@/hooks/useGameData';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { useDailyQuests } from '@/hooks/useGameData';
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
  const { data: progress } = useLessonProgress();
  const { data: profile } = useProfile();
  const { data: quests } = useDailyQuests();
  const navigate = useNavigate();
  const [searchParams, setSearchParams] = useSearchParams();

  const openSections = useMemo(() => {
    const hash = searchParams.get('open');
    const set = hash ? new Set(hash.split(',').map(Number)) : new Set([1, 2]);
    // Sempre garante pelo menos 1 seção aberta
    if (set.size === 0) set.add(1);
    return set;
  }, [searchParams]);

  const toggleSection = (sectionId: number) => {
    let next = new Set(openSections);
    const sectionsArray = Array.from(sections.keys()).sort((a, b) => a - b);
    const currentIdx = sectionsArray.indexOf(sectionId);
    
    if (next.has(sectionId)) {
      // Se fechando, abre a próxima disponível se só tem 1 aberta
      if (next.size === 1) {
        const nextSection = sectionsArray.find(s => s !== sectionId);
        if (nextSection) next.add(nextSection);
      }
      next.delete(sectionId);
    } else {
      next.add(sectionId);
    }
    
    setSearchParams({ open: Array.from(next).join(',') });
  };

  const todayQuest = useMemo(() => {
    if (!quests || quests.length === 0) return null;
    const dayIndex = getDayOfYear() % quests.length;
    const sorted = [...quests].sort((a, b) => ((a as any).day_index ?? 0) - ((b as any).day_index ?? 0));
    return sorted[dayIndex] || quests[0];
  }, [quests]);

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

  const completedIds = new Set(progress?.filter(p => p.completed).map(p => p.lesson_id) ?? []);
  
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

  const getLessonSlug = (title: string): string | null => {
    const match = title.match(/^(\d+\.\d+)/);
    if (match) return moduleSlugMap.get(match[1]) ?? null;
    return null;
  };

  const handleLessonClick = (lesson: any, unlocked: boolean) => {
    if (!unlocked) return;
    const slug = getLessonSlug(lesson.title);
    if (slug) {
      navigate(`/modulo/${slug}`);
    } else {
      navigate(`/lesson/${lesson.id}`);
    }
  };

  // Calcular lições completadas HOJE
  const lessonsCompletedToday = useMemo(() => {
    if (!progress || !profile?.last_lesson_date) return 0;
    const today = new Date().toISOString().split('T')[0];
    // last_lesson_date está no formato ISO, verificar se é de hoje
    const isToday = profile.last_lesson_date.split('T')[0] === today;
    if (!isToday) return 0;
    // Contar lições com completion_date de hoje
    return progress.filter(p => {
      if (!p.completed || !p.completed_at) return false;
      return p.completed_at.split('T')[0] === today;
    }).length;
  }, [progress, profile]);

  const isQuestCompleted = todayQuest && profile ? (() => {
    const q = todayQuest as any;
    switch (q.requirement_type) {
      case 'lessons_completed': 
        console.log('DEBUG quests - lessons completed today:', lessonsCompletedToday, 'required:', q.requirement_value);
        return (lessonsCompletedToday >= q.requirement_value);
      case 'xp_earned': return ((profile.xp_total ?? 0) >= q.requirement_value);
      case 'streak_maintain': return ((profile.streak_current ?? 0) >= q.requirement_value);
      default: return false;
    }
  })() : false;

  return (
    <AppLayout>
      <div className="space-y-6">
        {todayQuest && (
          <div className={`bg-card rounded-2xl border p-4 space-y-3 ${
            isQuestCompleted ? 'border-finlingo-coins' : ''
          }`}>
            <div className="flex items-center gap-2 font-bold text-foreground">
              <Target className="h-5 w-5 text-accent" />
              Missão Diária
            </div>
            <div className={`flex items-center justify-between rounded-xl px-3 py-2 text-sm ${
              isQuestCompleted ? 'bg-finlingo-coins/10' : 'bg-muted'
            }`}>
              <span>{(todayQuest as any).description}</span>
              {isQuestCompleted ? (
                <span className="font-bold text-finlingo-coins">✅ Completa!</span>
              ) : (
                <span className="font-bold text-finlingo-xp">+{(todayQuest as any).xp_reward} XP</span>
              )}
            </div>
          </div>
        )}

        {profile && (
          <div className="bg-card rounded-2xl border p-4 space-y-2">
            <div className="flex items-center justify-between">
              <span className="font-bold flex items-center gap-2">
                <Zap className="h-5 w-5 text-finlingo-xp" />
                XP Total
              </span>
              <span className="font-black text-finlingo-xp text-xl">{profile.xp_total}</span>
            </div>
            <div className="flex items-center justify-between text-sm text-muted-foreground">
              <span>Liga: {profile.league}</span>
              <span>XP Semanal: {profile.xp_weekly}</span>
            </div>
          </div>
        )}

        {Array.from(sections.entries()).map(([sectionId, section], idx) => {
          const isOpen = openSections.has(sectionId);
          return (
            <div key={sectionId} className="space-y-2">
              <button
                onClick={() => toggleSection(sectionId)}
                className="w-full flex items-center gap-3 p-3 rounded-xl bg-card border hover:bg-muted/50 transition-all"
              >
                <div className={`w-10 h-10 rounded-xl ${SECTION_COLORS[idx % 2]} flex items-center justify-center text-xl`}>
                  {SECTION_ICONS[idx % 2]}
                </div>
                <div className="flex-1 text-left">
                  <h2 className="font-bold text-foreground">Seção {sectionId}</h2>
                  <p className="text-xs text-muted-foreground">{section.title}</p>
                </div>
                {isOpen ? (
                  <svg className="h-5 w-5 text-muted-foreground" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" /></svg>
                ) : (
                  <svg className="h-5 w-5 text-muted-foreground" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" /></svg>
                )}
              </button>

              {isOpen && (
              <div className="flex flex-col gap-2">
                {section.lessons?.map((lesson) => {
                  const completed = completedIds.has(lesson.id);
                  const unlocked = isLessonUnlocked(sectionId, lesson.lesson_number);
                  const perfect = progress?.find(p => p.lesson_id === lesson.id)?.perfect;

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
                      {perfect && <Star className="h-4 w-4 text-finlingo-coins" />}
                    </button>
                  );
                })}
              </div>
              )}
            </div>
          );
        })}
      </div>
    </AppLayout>
  );
}