# Deploy FinLingo

## Como usar

### Primeira vez (terminal/powershell):
```powershell
.\deploy.cmd
```

### Ou manualmente:
```powershell
git add -A
git commit -m "Deploy: atualizacoes"
git push origin main
```

## Arquivos modificados
- vercel.json (corrige reload em URLs especificas)
- LearnPage.tsx (secoes retrateis)
- AppLayout.tsx (verso original)
- useGameData.ts (original)
- App.tsx (original)

## Notas
- O Vercel faz build automaticamente apos push
- Verifique no painel do Vercel se o deploy foi bem-sucedido