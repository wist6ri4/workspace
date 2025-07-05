# supabaseとの連携手順

## リモートデータベースからの取得
### 1. Supabase CLIのインストール（初回のみ）
```bash
npx npm install supabase --save-dev
```

### 2. Supabaseプロジェクトの作成（初回のみ）
```bash
npx supabase init
```

以下でローカルのSupabaseプロジェクトを起動できる。
```bash
npx supabase start
```

### 3.ログイン
```bash
npx supabase login
```

### 4. プロジェクトとのリンク
https://supabase.com/dashboard/project/[YOUR_PROJECT_ID]

URLの上記部分。
```bash
npx supabase link --project-ref [YOUR_PROJECT_ID]
```

### 5. リモートデータベースのスキーマを取得
```bash
npx supabase db pull
```

### 6. ローカルにseed.sqlを作成
```sql
-- supabase/seed.sql
INSERT INTO users (id, name, email) VALUES
  (1, 'Alice', '...')
```

### 7. ローカルにマイグレーションを適用
```bash
npx supabase db reset
```

### 8. ローカルのデータを確認
デフォルトで以下から確認できる。

http://127.0.0.1:54323


## 新しいプロジェクトでの復元手順
### 1. 新しいプロジェクトを作成
```bash
npx supabase projects create "新しいプロジェクト名"
```

### 2. プロジェクトとのリンク
```bash
npx supabase link --project-ref [新しいプロジェクトのID]
```

### 3. マイグレーションを実行してスキーマを復元
```bash
npx supabase db push
```

## 4. ローカルでDBを変更した場合
ローカルでDBを変更した場合は、以下のコマンドでリモートデータベースに変更を反映できます。
```bash
npx supabase db diff --use-migra -f [マイグレーション名]
npx supabase db push
```