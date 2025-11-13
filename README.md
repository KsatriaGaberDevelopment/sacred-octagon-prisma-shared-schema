# HOW TO

How to update db structure using this Prisma git repo

## Before
- Harus ada PGSQL di local machone (the easiest way is using docker!)
- Konfigurasi .env dengan credential pgsql 
- Jalankan migrasi : `npx prisma migrate deploy` (apabila tidak ada error, maka db di local machine akan sama dengan yang ada di struktur)


# How to:
- Update `prisma/schema.prisma` (Docs: https://www.prisma.io/docs/orm/prisma-schema/data-model)
- Lalu jalankan command<br> 
`npx prisma migrate dev --name [your_migration_name]` <br>Contoh: `npx prisma migrate dev --name alter_user_table_add_bot_collumn`<br>**tip: biasakan satu perubahan satu nama**
- Setelah itu jalankan `npm run build` (pastikan sudah menginstall dependency-nya `npm install`)
- Push commit ke Github (pastikan folder `dist` ikut ter-push ke Github)
- Ambil nomor revisinya<br>`pushed 1 commit • af3b252…d7a3374 • 9 hours ago`<br>Nomor revisinya: **d7a3374**


# Update on source
- Pada aplikasi yang menggunakan shared schema ini buka `package.json` pada item `dependencies` cari `@ksatriagaberdevelopment/prisma-shared-schema` ubah valuenya ke: `git+ssh://git@github.com/KsatriaGaberDevelopment/sacred-octagon-prisma-shared-schema.git#[nomor-revisi]`
- Jalankan command `npm install --force` (Jangan menjalankan `npm update` karena akan mengupdate package yang mungkin akan menyebabkan error karena **broken changes**)
- Untuk menjalankannya: `npx prisma migrate deploy`

# Recomendation
- Better backup your DB before you run migration

