import fs from 'node:fs/promises'
import { fileURLToPath } from 'node:url'

export const ABI = JSON.parse(await fs.readFile(
  fileURLToPath(new URL('./Abi.json', import.meta.url))
))

export const ADDRESS = '0x8460766edc62b525fc1fa4d628fc79229dc73031'
