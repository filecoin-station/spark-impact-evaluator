import fs from 'node:fs/promises'
import { fileURLToPath } from 'node:url'

export const address = '0xaaef78eaf86dcf34f275288752e892424dda9341'
export const abi = JSON.parse(
  await fs.readFile(
    fileURLToPath(new URL('./Abi.json', import.meta.url)),
    'utf8'
  )
)
