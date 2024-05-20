export interface Reference {
  id: string
}

export function reference(id: string): Reference {
  return {id}
}
