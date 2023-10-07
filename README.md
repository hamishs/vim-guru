# Vim Guru
### An LLM powered vim assistant

A neovim plugin that you can ask questions to help improve your vim motions.

## Installation
Clone the repository and use your neovim package manager to install:
```
use '~/vim-guru'
```

Requires the `lua-openai` package which can be installed with `luarocks`.


## Usage
Supply an Open AI api key to use for queries.
```
export OPENAI_API_KEY="123"
```

From within neovim:
```
:Guru
```

You will be able to enter your question and recieve the answer straightaway:
```
Q:  How can I select the entire body of a function?

A: To select all text within a function: vai)
```

Todo:
* Add user's config and current window to the prompt.
* Save api key once.
* Use a better window for dialogue.

