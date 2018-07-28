const BASE_URL = 'https://api.github.com/search/repositories?q='
// q=tetris+language:assembly&sort=stars&order=desc
const LANGUAGES = ['ruby', 'c++', 'java', 'javascript']
const PAGE_SIZE = 30
export function full_url(search, language = '', page = 0){
  let url = `${BASE_URL}${search}`
  if (language === '') return url
  return `${url}+language:${language}`
}

const LANG_OPTIONS = LANGUAGES.map( item => 
  ({value: item, label: item}));

export {
  LANG_OPTIONS,
  PAGE_SIZE
}