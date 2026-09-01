DRA. SUZANA CAVALCANTE — V7 CLOUDFLARE D1

Esta versão NÃO usa localStorage/sessionStorage para os dados do site.
Agendamentos, avaliações, conteúdo, tratamentos, horários, promoção, aparência e login do admin usam Cloudflare D1 + Pages Functions.
A sessão do admin usa cookie HttpOnly assinado.

PASSOS DEPOIS DE SUBIR AO GITHUB:
1. No Cloudflare, crie um banco D1 chamado: suzana-tricologia-db
2. Abra o Console do banco D1 e execute TODO o arquivo schema.sql.
3. No projeto Pages: Settings > Bindings > Add > D1 database.
4. Variable name: DB
5. Selecione: suzana-tricologia-db
6. Em Settings > Variables and Secrets, crie um SECRET:
   ADMIN_SESSION_SECRET = uma sequência longa e aleatória (mínimo 32 caracteres).
7. Faça novo deploy do projeto.
8. Abra /admin.html e use “Primeiro acesso / Cadastre-se”. Apenas o primeiro administrador pode ser criado.

IMPORTANTE:
- Pages Functions exigem deploy via Git/Wrangler; não use Direct Upload para esta versão.
- Fotos enviadas em avaliações e a foto de capa são comprimidas no navegador antes do envio e armazenadas no D1 como dados de imagem. Para uma clínica pequena funciona, mas no futuro R2 é a opção ideal para muitas imagens.
- A recuperação de senha local da V6 foi removida da lógica segura. Se perder a senha, redefina via manutenção/admin técnico; não existe reset inseguro por e-mail sem provedor de e-mail.
