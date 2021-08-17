import express from 'express'
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()
const app = express()

app.use(express.json())

/** 
* logic for our api will go here
*/
export default {
  path: '/api',
  handler: app
}

app.post(`/usuarios`, async (req, res) => {
  console.log(req.body)
  const result = await prisma.usuario.create({
    data: {
      email: req.body.email,
      name: req.body.name,
      avatar: req.body.avatar,
      telefono: req.body.telefono,
    },
  })
  res.json(result)
})

app.get('/usuarios', async (req, res) => {
  console.log('get usuarios')
  const usuarios = await prisma.usuario.findMany()
  res.json(usuarios)
})