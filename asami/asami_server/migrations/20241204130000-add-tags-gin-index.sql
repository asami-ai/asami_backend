-- Add GIN index for tags column with proper operator class
CREATE INDEX IF NOT EXISTS tags_search_gin_idx ON products USING gin (tags jsonb_path_ops);
```

You only create this once, commit it to git, and it becomes part of your migration history.
