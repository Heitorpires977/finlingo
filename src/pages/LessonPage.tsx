import { useState, useEffect, useMemo } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useAuth } from '@/hooks/useAuth';
import { useProfile, useCompleteLessonMutation, useLoseHeartMutation, useLesson } from '@/hooks/useGameData';
import { toast } from 'sonner';
import { LessonHeader } from '@/components/lesson/LessonHeader';
import { LessonFooter } from '@/components/lesson/LessonFooter';
import { ActivityContent } from '@/components/lesson/ActivityContent';
import { ExplanationSlide } from '@/components/lesson/ExplanationSlide';
import { ExampleSlide } from '@/components/lesson/ExampleSlide';
import { LessonSkeleton } from '@/components/lesson/LessonSkeleton';
import { NoHeartsScreen } from '@/components/lesson/NoHeartsScreen';
import type { LessonStep, Activity, ContentSlide } from '@/components/lesson/types';

export default function LessonPage() {
  const { id } = useParams<{ id: string }>();
  const navigate = useNavigate();
  const { user } = useAuth();
  const { data: profile, refetch: refetchProfile } = useProfile();
  const completeLesson = useCompleteLessonMutation();
  const loseHeart = useLoseHeartMutation();
  const { data: lesson, isLoading: lessonLoading } = useLesson(id);

  const [currentIdx, setCurrentIdx] = useState(0);
  const [hearts, setHearts] = useState(0);
  const [profileLoaded, setProfileLoaded] = useState(false);
  const [answered, setAnswered] = useState(false);
  const [isCorrect, setIsCorrect] = useState(false);
  const [selectedOption, setSelectedOption] = useState<number | null>(null);
  const [fillAnswer, setFillAnswer] = useState('');
  const [mistakes, setMistakes] = useState(0);
  const [matchSelected, setMatchSelected] = useState<{ side: 'left' | 'right'; idx: number } | null>(null);
  const [matchedPairs, setMatchedPairs] = useState<Set<number>>(new Set());
  const [shuffledRight, setShuffledRight] = useState<number[]>([]);
  const [slideDirection, setSlideDirection] = useState<'left' | 'right'>('left');

  useEffect(() => {
    if (profile) {
      setHearts(profile.effectiveHearts ?? profile.hearts ?? 0);
      setProfileLoaded(true);
    }
  }, [profile]);

  // Build unified steps: intro slides + activities
  const steps: LessonStep[] = useMemo(() => {
    if (!lesson) return [];

    let activities = lesson.activity_data;
    if (!activities) return [];
    
    // Se for string, faz parse
    if (typeof activities === 'string') {
      try {
        activities = JSON.parse(activities);
      } catch {
        return [];
      }
    }
    
    // Se for objeto com propriedade 'steps', extrai o array diretamente
    if (!Array.isArray(activities) && typeof activities === 'object') {
      if (Array.isArray((activities as any).steps)) {
        activities = (activities as any).steps;
      } else {
        activities = [activities];
      }
    }
    
    // Se ainda não for array, wrapped em array
    if (!Array.isArray(activities)) {
      return [];
    }
    
    const hasSlides = activities.some((a: any) => a && a.type && (a.type === 'explanation' || a.type === 'example'));

    if (hasSlides) {
      return activities.filter((a: any) => a).map((a: any) =>
        a.type === 'explanation' || a.type === 'example'
          ? { ...a, _kind: 'slide' as const }
          : { ...a, _kind: 'activity' as const }
      );
    }

    // No default slides — just use activities directly
    const acts: LessonStep[] = activities.filter((a: any) => a).map((a: any) => ({ ...a, _kind: 'activity' as const }));
    return acts;
  }, [lesson]);

  const currentStep = steps[currentIdx];

  useEffect(() => {
    if (currentStep?._kind === 'activity' && currentStep.type === 'match_pairs' && currentStep.pairs) {
      const indices = currentStep.pairs.map((_: any, i: number) => i);
      setShuffledRight(indices.sort(() => Math.random() - 0.5));
      setMatchedPairs(new Set());
      setMatchSelected(null);
    }
  }, [currentIdx, steps.length]);

  if (!lesson || lessonLoading) return <LessonSkeleton />;
  
  if (steps.length === 0 || !currentStep) {
    return <LessonSkeleton />;
  }

  const totalSteps = steps.length;
  const isContentSlide = currentStep?._kind === 'slide';
  const progressPct = ((currentIdx + (isContentSlide || answered ? 1 : 0)) / totalSteps) * 100;

  console.log('DEBUG render:', currentIdx, totalSteps, currentStep?.type, 'answered:', answered);

  const checkAnswer = (correct: boolean) => {
    setAnswered(true);
    setIsCorrect(correct);
    if (!correct) {
      setMistakes(m => m + 1);
      setHearts(h => Math.max(0, h - 1));
      loseHeart.mutate();
    }
  };

  const handleMultipleChoice = (idx: number) => {
    if (answered) return;
    setSelectedOption(idx);
    const correctVal = (currentStep as Activity).correct;
    console.log('DEBUG multiple choice - idx:', idx, 'correctVal:', correctVal);
    
    // Se correct for string com número, converter para número
    if (typeof correctVal === 'string') {
      const optIndex = parseInt(correctVal);
      if (!isNaN(optIndex)) {
        checkAnswer(idx === optIndex);
      } else {
        const options = (currentStep as Activity).options || [];
        const correctOption = options[idx];
        const isCorrect = correctOption && correctOption.toLowerCase().includes(correctVal.toLowerCase());
        checkAnswer(isCorrect);
      }
    } else {
      // Se correctVal é 0, 1, 2, etc - usar diretamente
      checkAnswer(idx === Number(correctVal));
    }
  };

  const handleTrueFalse = (val: boolean) => {
    if (answered) return;
    const correctVal = (currentStep as Activity).correct;
    // Se correct for uma string, verificar o texto
    if (typeof correctVal === 'string') {
      const expectedTrue = correctVal.toLowerCase() === 'true' || correctVal === '1' || correctVal === 'verdadeiro';
      checkAnswer(val === expectedTrue);
    } else {
      const normalized = (correctVal === true || correctVal === 1 || correctVal === '1' || correctVal === 'true') ? 1 : 0;
      checkAnswer((val ? 1 : 0) === normalized);
    }
  };

  const handleFillBlank = () => {
    if (answered) return;
    
    // Função de normalização muito flexível
    const normalize = (s: string) => {
      let txt = s.toLowerCase().trim();
      // Remove acentos
      txt = txt.normalize('NFD').replace(/[\u0300-\u036f]/g, '');
      // Substitui & por "e" 
      txt = txt.replace(/&/g, 'e');
      // Remove todos os tipos de espaços (múltiplos, tabs, etc)
      txt = txt.replace(/\s+/g, '');
      // Versão só letras/números (sem espaço)
      const noSpace = txt;
      // Versão com espaços normais
      const withSpace = txt.replace(/([a-z])([0-9])/g, '$1 $2').replace(/([0-9])([a-z])/g, '$1 $2').replace(/ +/g, ' ').trim();
      
      return [noSpace, withSpace];
    };
    
    const userNorm = normalize(fillAnswer);
    const correctNorm = normalize((currentStep as Activity).answer || '');
    
    // Verifica qualquer variação
    const correct = userNorm.some(u => correctNorm.includes(u)) || 
                 correctNorm.some(c => userNorm.includes(c)) ||
                 userNorm[0] === correctNorm[0] ||
                 userNorm[1] === correctNorm[1];
    
    checkAnswer(correct);
  };

  const handleMatchClick = (side: 'left' | 'right', idx: number) => {
    const activity = currentStep as Activity;
    if (!activity.pairs) return;
    if (matchedPairs.has(idx) && side === 'left') return;

    if (!matchSelected) {
      setMatchSelected({ side, idx });
    } else if (matchSelected.side === side) {
      setMatchSelected({ side, idx });
    } else {
      const leftIdx = side === 'left' ? idx : matchSelected.idx;
      const rightOriginalIdx = side === 'right' ? idx : matchSelected.idx;

      if (shuffledRight[rightOriginalIdx] === leftIdx) {
        const newMatched = new Set(matchedPairs);
        newMatched.add(leftIdx);
        setMatchedPairs(newMatched);
        if (newMatched.size === activity.pairs!.length) {
          checkAnswer(true);
        }
      }
      setMatchSelected(null);
    }
  };

  const goToStep = async (direction: 'next' | 'prev') => {
    // Reset state for new activity
    setAnswered(false);
    setIsCorrect(false);
    setSelectedOption(null);
    setFillAnswer('');
    setMatchSelected(null);
    setMatchedPairs(new Set());
    
    if (direction === 'next') {
      if (currentIdx + 1 >= totalSteps) {
        // Lesson complete
        try {
          console.log('Complete lesson called with id:', id, 'mistakes:', mistakes);
          const oldXp = profile?.xp_total ?? 0;
          const result = await completeLesson.mutateAsync({ lessonId: id!, mistakes });
          console.log('Complete lesson result:', result);
          await refetchProfile();
          const coinMsg = result.coinsEarned > 0 ? ` e +${result.coinsEarned} 🪙` : '';
          toast.success(`Atividade concluída! +${result.xpEarned} XP${coinMsg} 🎉`);

          const milestoneCoins = Math.floor((oldXp + result.xpEarned) / 100) - Math.floor(oldXp / 100);
          if (milestoneCoins > 0) {
            setTimeout(() => {
              toast('🪙 Parabéns! Você acumulou +100 XP e ganhou 1 FinCoin!', {
                duration: 3000,
                style: {
                  background: 'hsl(var(--primary))',
                  color: 'hsl(var(--primary-foreground))',
                  border: 'none',
                },
              });
            }, 1500);
          }
        } catch (err: any) {
          console.error('Error completing lesson:', err);
          toast.error('Erro ao salvar progresso: ' + (err?.message || err));
        }
        navigate('/learn');
        return;
      }

      setSlideDirection('left');
      setCurrentIdx(i => i + 1);
    } else {
      if (currentIdx <= 0) return;
      setSlideDirection('right');
      setCurrentIdx(i => i - 1);
    }

    // Reset activity state
    setAnswered(false);
    setIsCorrect(false);
    setSelectedOption(null);
    setFillAnswer('');
  };

  // Show loading while profile loads (to check hearts)
  if (!profileLoaded) {
    return (
      <div className="min-h-screen bg-background flex items-center justify-center">
        <div className="animate-pulse text-muted-foreground">Carregando...</div>
      </div>
    );
  }

  if (hearts <= 0) return <NoHeartsScreen onBack={() => navigate('/learn')} />;

  return (
    <div className="min-h-screen bg-background flex flex-col">
      <LessonHeader hearts={hearts} progressPct={progressPct} onClose={() => navigate('/learn')} />

      <div className="flex-1 max-w-lg mx-auto w-full px-4 py-8 space-y-6 overflow-hidden">
        <div
          key={currentIdx}
          className={slideDirection === 'left' ? 'animate-slide-in-left' : 'animate-slide-in-right'}
        >
          {isContentSlide ? (
            (currentStep as ContentSlide).type === 'explanation' ? (
              <ExplanationSlide slide={currentStep as ContentSlide} />
            ) : (
              <ExampleSlide slide={currentStep as ContentSlide} />
            )
          ) : (
            <ActivityContent
              activity={currentStep as Activity}
              answered={answered}
              isCorrect={isCorrect}
              selectedOption={selectedOption}
              fillAnswer={fillAnswer}
              matchSelected={matchSelected}
              matchedPairs={matchedPairs}
              shuffledRight={shuffledRight}
              onMultipleChoice={handleMultipleChoice}
              onTrueFalse={handleTrueFalse}
              onFillChange={setFillAnswer}
              onFillSubmit={handleFillBlank}
              onMatchClick={handleMatchClick}
            />
          )}
        </div>

        <LessonFooter
          answered={answered}
          isCorrect={isCorrect}
          activity={isContentSlide ? null : (currentStep as Activity)}
          isContentSlide={isContentSlide}
          isLastActivity={currentIdx + 1 >= totalSteps}
          isPending={completeLesson.isPending}
          onNext={() => goToStep('next')}
        />
      </div>
    </div>
  );
}
