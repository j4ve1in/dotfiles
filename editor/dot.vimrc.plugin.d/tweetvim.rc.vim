let g:tweetvim_display_icon = 1
let g:tweetvim_display_source = 1
let g:tweetvim_tweet_per_page = 60
let g:tweetvim_config_dir = expand('~/.vim/var/tmp/plugin/tweetvim')

nnoremap [TweetVim] <Nop>
nmap <Space>t [TweetVim]

nnoremap <silent> [TweetVim] :<C-u>TweetVimHomeTimeline<CR>
nnoremap <silent> [TweetVim]m :<C-u>TwetVimMentions<CR>
nnoremap <silent> [TweetVim]s :<C-u>TweetVimSay<CR>
