import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import type { Activity } from './types';

/* ─── Multiple Choice ─── */
interface MultipleChoiceProps {
  activity: Activity;
  answered: boolean;
  isCorrect: boolean;
  selectedOption: number | null;
  onSelect: (idx: number) => void;
}

function MultipleChoice({ activity, answered, isCorrect, selectedOption, onSelect }: MultipleChoiceProps) {
  if (!activity.options) return null;
  return (
    <div className="space-y-3">
      {activity.options.map((opt, i) => (
        <button
          key={i}
          onClick={() => onSelect(i)}
          disabled={answered}
          className={`w-full text-left p-4 rounded-2xl border-2 font-semibold transition-all duration-200 ${
            answered && i === activity.correct
              ? 'bg-finlingo-correct/10 border-finlingo-correct text-foreground'
              : answered && i === selectedOption && !isCorrect
              ? 'bg-finlingo-wrong/10 border-finlingo-wrong text-foreground animate-shake'
              : selectedOption === i
              ? 'border-primary bg-primary/5 text-foreground'
              : 'border-border hover:border-primary/50 bg-card text-foreground active:scale-[0.98]'
          }`}
        >
          {opt}
        </button>
      ))}
    </div>
  );
}

/* ─── True / False ─── */
interface TrueFalseProps {
  activity: Activity;
  answered: boolean;
  onSelect: (val: boolean) => void;
}

function TrueFalse({ activity, answered, onSelect }: TrueFalseProps) {
  return (
    <div className="flex gap-4">
      {([
        { label: 'Verdadeiro', value: true },
        { label: 'Falso', value: false },
      ] as const).map(({ label, value }) => (
        <button
          key={label}
          onClick={() => onSelect(value)}
          disabled={answered}
          className={`flex-1 p-4 rounded-2xl border-2 font-bold text-lg transition-all duration-200 ${
            answered && value === activity.correct
              ? 'bg-finlingo-correct/10 border-finlingo-correct text-foreground'
              : answered && value !== activity.correct
              ? 'bg-finlingo-wrong/10 border-finlingo-wrong text-foreground opacity-50'
              : 'border-border hover:border-primary/50 bg-card text-foreground active:scale-[0.98]'
          }`}
        >
          {label}
        </button>
      ))}
    </div>
  );
}

/* ─── Fill in the Blank ─── */
interface FillBlankProps {
  answered: boolean;
  fillAnswer: string;
  onChangeAnswer: (val: string) => void;
  onSubmit: () => void;
}

function FillBlank({ answered, fillAnswer, onChangeAnswer, onSubmit }: FillBlankProps) {
  return (
    <div className="space-y-4">
      <Input
        value={fillAnswer}
        onChange={e => onChangeAnswer(e.target.value)}
        placeholder="Digite sua resposta..."
        disabled={answered}
        onKeyDown={e => e.key === 'Enter' && onSubmit()}
        className="text-lg h-14"
      />
      {!answered && (
        <Button onClick={onSubmit} className="w-full h-12" disabled={!fillAnswer.trim()}>
          Verificar
        </Button>
      )}
    </div>
  );
}

/* ─── Match Pairs ─── */
interface MatchPairsProps {
  activity: Activity;
  answered: boolean;
  matchSelected: { side: 'left' | 'right'; idx: number } | null;
  matchedPairs: Set<number>;
  shuffledRight: number[];
  onMatchClick: (side: 'left' | 'right', idx: number) => void;
}

function MatchPairs({ activity, answered, matchSelected, matchedPairs, shuffledRight, onMatchClick }: MatchPairsProps) {
  if (!activity.pairs || activity.pairs.length === 0) return null;
  
  const pairs = activity.pairs;
  return (
    <div className="grid grid-cols-2 gap-3">
      <div className="space-y-2">
        {pairs.map((p, i) => (
          <button
            key={`l-${i}`}
            onClick={() => onMatchClick('left', i)}
            disabled={matchedPairs.has(i) || answered}
            className={`w-full p-3 rounded-xl border-2 font-semibold text-sm transition-all duration-200 ${
              matchedPairs.has(i)
                ? 'bg-finlingo-correct/10 border-finlingo-correct text-foreground'
                : matchSelected?.side === 'left' && matchSelected.idx === i
                ? 'border-primary bg-primary/10 text-foreground'
                : 'border-border bg-card text-foreground hover:border-primary/50'
            }`}
          >
            {p.left ?? p.term ?? ''}
          </button>
        ))}
      </div>
      <div className="space-y-2">
        {shuffledRight.map((origIdx, displayIdx) => (
          <button
            key={`r-${displayIdx}`}
            onClick={() => onMatchClick('right', displayIdx)}
            disabled={matchedPairs.has(origIdx) || answered}
            className={`w-full p-3 rounded-xl border-2 font-semibold text-sm transition-all duration-200 ${
              matchedPairs.has(origIdx)
                ? 'bg-finlingo-correct/10 border-finlingo-correct text-foreground'
                : matchSelected?.side === 'right' && matchSelected.idx === displayIdx
                ? 'border-secondary bg-secondary/10 text-foreground'
                : 'border-border bg-card text-foreground hover:border-secondary/50'
            }`}
          >
            {pairs[origIdx]?.right ?? pairs[origIdx]?.definition ?? ''}
          </button>
        ))}
      </div>
    </div>
  );
}

/* ─── Main export ─── */
interface ActivityContentProps {
  activity: Activity;
  answered: boolean;
  isCorrect: boolean;
  selectedOption: number | null;
  fillAnswer: string;
  matchSelected: { side: 'left' | 'right'; idx: number } | null;
  matchedPairs: Set<number>;
  shuffledRight: number[];
  onMultipleChoice: (idx: number) => void;
  onTrueFalse: (val: boolean) => void;
  onFillChange: (val: string) => void;
  onFillSubmit: () => void;
  onMatchClick: (side: 'left' | 'right', idx: number) => void;
}

export function ActivityContent(props: ActivityContentProps) {
  const { activity } = props;

  if (!activity || !activity.type) return null;

  // Support both "activity" and "multiple_choice" types
  const rawType = activity.type || '';
  const activityType = rawType === 'activity' ? 'multiple_choice' : rawType.replace('_', '').replace('in', '').replace('the', '');

  // Get title - support different field names for different activity types
  const getTitle = () => {
    if (activityType.includes("true")) return activity.statement || activity.question || "Verdadeiro ou Falso?";
    if (activityType.includes("fill")) return activity.sentence || activity.question || "Complete a frase:";
    if (activityType.includes("match")) return activity.instruction || activity.question || "Relacione as colunas:";
    return activity.question || "";
  };

  return (
    <>
      {getTitle() && (
        <h2 className="text-xl font-black text-foreground animate-fade-in">{getTitle()}</h2>
      )}

      {(activityType.includes("multiple") || activityType === "quiz") && (
        <MultipleChoice
          activity={activity}
          answered={props.answered}
          isCorrect={props.isCorrect}
          selectedOption={props.selectedOption}
          onSelect={props.onMultipleChoice}
        />
      )}

      {(activityType.includes("true")) && (
        <TrueFalse activity={activity} answered={props.answered} onSelect={props.onTrueFalse} />
      )}

      {(activityType.includes("fill")) && (
        <FillBlank
          answered={props.answered}
          fillAnswer={props.fillAnswer}
          onChangeAnswer={props.onFillChange}
          onSubmit={props.onFillSubmit}
        />
      )}

      {(activityType.includes("match")) && (
        <MatchPairs
          activity={activity}
          answered={props.answered}
          matchSelected={props.matchSelected}
          matchedPairs={props.matchedPairs}
          shuffledRight={props.shuffledRight}
          onMatchClick={props.onMatchClick}
        />
      )}
    </>
  );
}
