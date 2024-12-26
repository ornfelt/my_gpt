export const MODEL_FAMILIES = {
  openai: 'OpenAI',
  azureOpenai: 'Azure OpenAI',
  anthropic: 'Anthropic',
  moonshot: 'Moonshot',
  gemini: 'Gemini',
  groq: 'Groq'
}

// OpenAI models will be loaded dynamically
export let OPENAI_GPT_MODELS: string[] = []

// Function to update OpenAI models
export function updateOpenAIModels(models: string[]) {
  OPENAI_GPT_MODELS = models
}

export const AZURE_OPENAI_GPT_MODELS = [
  "gpt-3.5-turbo",
  "gpt-35-turbo-16k",
  "gpt-35-turbo-instruct",
  "gpt-4",
  "gpt-4-32k"
]

export const OPENAI_EMBEDDING_MODELS = [
  "text-embedding-3-large",
  "text-embedding-3-small",
  "text-embedding-ada-002"
]

export const GEMINI_EMBEDDING_MODELS = [
  "text-embedding-004"
]

export const ANTHROPIC_MODELS = [
  "claude-3-5-sonnet-latest",
  "claude-3-5-haiku-latest",
  "claude-3-5-sonnet-20241022",
  "claude-3-5-haiku-20241022",
  "claude-3-haiku-20240307",
  "claude-3-opus-20240229",
  "claude-3-sonnet-20240229",
  "claude-2.1",
  "claude-2.0",
  "claude-instant-1.2"
]

export const MOONSHOT_MODELS = [
  "moonshot-v1-8k",
  "moonshot-v1-32k",
  "moonshot-v1-128k"
]

export const GEMINI_MODELS = [
  "gemini-2.0-flash-thinking-exp-1219",
  "gemini-2.0-flash-exp",
  "gemini-1.5-flash",
  "gemini-1.5-flash-8b",
  "gemini-1.5-pro",
  "gemini-1.0-pro",
]

export const GROQ_MODELS = [
  "llama-3.1-405b-reasoning",
  "llama-3.1-70b-versatile",
  "llama-3.1-8b-instant",
  "llama3-8b-8192",
  "llama3-70b-8192",
  "llama2-70b-4096",
  "mixtral-8x7b-32768",
  "gemma-7b-it",
  "gemma2-9b-it",
]
