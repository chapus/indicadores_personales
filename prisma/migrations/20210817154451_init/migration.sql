-- CreateTable
CREATE TABLE "Indicador" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "published" BOOLEAN NOT NULL DEFAULT false
);

-- CreateTable
CREATE TABLE "Usuario" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "name" TEXT,
    "avatar" TEXT,
    "telefono" TEXT
);

-- CreateTable
CREATE TABLE "Usuario_indicador" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "indicadorId" INTEGER,
    "usuarioId" INTEGER,
    FOREIGN KEY ("indicadorId") REFERENCES "Indicador" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY ("usuarioId") REFERENCES "Usuario" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario.email_unique" ON "Usuario"("email");
