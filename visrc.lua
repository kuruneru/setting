require('vis')

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    vis:command('set number')
    vis:command('set cursorline')
    vis:command('set showmatch')
    vis:command('set tabwidth 2')
    vis:command('set expandtab')
    vis:command('set ignorecase')
end)

-- ノーマルモード用の基本マッピング
vis:map(vis.modes.NORMAL, ' w', ':w<Enter>')
vis:map(vis.modes.NORMAL, ' q', ':q<Enter>')
vis:map(vis.modes.NORMAL, ' wq', ':wq<Enter>')
vis:map(vis.modes.NORMAL, ' h', '<Escape>')
vis:map(vis.modes.NORMAL, ' n', ':bnext<Enter>')
vis:map(vis.modes.NORMAL, ' p', ':bprev<Enter>')
vis:map(vis.modes.NORMAL, ' ;', ':')
vis:map(vis.modes.NORMAL, ' d', ':split<Enter>')
vis:map(vis.modes.NORMAL, ' dv', ':vsplit<Enter>')
vis:map(vis.modes.INSERT, 'jj', '<Escape>')

-- 検索と置換
vis:map(vis.modes.NORMAL, ' s', '?')
vis:map(vis.modes.NORMAL, ' r', ':%s/')

-- どんなときでも（Normal/Visual/Operator-pending） '-' と ' e' で最後まで行けるようにする
local eol_modes = {
    vis.modes.NORMAL,
    vis.modes.VISUAL,
    vis.modes.VISUAL_LINE,
    vis.modes.OPERATOR_PENDING
}

for _, mode in ipairs(eol_modes) do
    vis:map(mode, '-', '$')
end
