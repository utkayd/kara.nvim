local M = {}

-- Color palette
M.colors = {
	-- Base colors
	fg = "#DFE0EA",
	bg = "#191B20",

	-- Background variants
	bg1 = "#1E2026",  -- line_bg, gutter_bg  
	bg2 = "#16181D",  -- dark, black
	bg3 = "#272932",  -- visual_select_bg, black1
	bg4 = "#21252D",  -- old gray

	-- Foreground/Gray variants
	gray1 = "#343842",
	gray2 = "#4D5264",  -- comment, vsplit_bg
	gray3 = "#495163",  -- selection_fg
	gray4 = "#515669",  -- gray_punc
	gray5 = "#515761",  -- popup_back, context
	gray6 = "#555B6C",  -- line_fg
	gray7 = "#5E697E",  -- selection_bg
	gray8 = "#606978",  -- non_text
	gray9 = "#6E7380",  -- old gray2
	gray10 = "#707891", -- cl_bg
	gray11 = "#AEAFAD", -- cursor_bg
	gray12 = "#BBBBBB", -- accent
	gray13 = "#cccccc", -- vsplit_fg
	gray14 = "#CFD0D7", -- white1

	-- Primary colors
	red = "#E85A84",
	red2 = "#D95555",
	green = "#94DD8E",
	green2 = "#8CD881",
	blue = "#7EB7E6",
	blue2 = "#568BB4",
	blue3 = "#6CAEC0",
	yellow = "#E9D26C",
	orange = "#E0828D",
	orange2 = "#E39A65",
	pink = "#D895C7",
}

-- Configuration options
M.config = {
	italic_comments = "italic",
	italic_keywords = "italic",
	italic_booleans = "italic",
	italic_functions = false,
	italic_variables = false,
	transparent_background = false,
}

function M.setup(opts)
	opts = opts or {}

	-- Merge config options
	M.config = vim.tbl_deep_extend("force", M.config, opts)

	local colors = M.colors
	local config = M.config

	-- Set vim options
	vim.o.termguicolors = true
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end
	vim.o.background = "dark"

	local highlights = {
		-----------------------------------------
		--        Styles
		-----------------------------------------
		Bold = { bold = true },
		Italic = { italic = true },
		Underlined = { underline = true },

		-----------------------------------------
		--        Editor settings
		-----------------------------------------
		Boolean = { fg = colors.orange, italic = config.italic_booleans == "italic" },

		Character = { fg = colors.yellow },
		ColorColumn = { bg = colors.bg3 },
		Comment = { fg = colors.gray2, italic = config.italic_comments == "italic" },
		Conceal = { fg = colors.fg },
		Conditional = { fg = colors.red },
		Constant = { fg = colors.pink },
		Cursor = { fg = colors.yellow, bg = colors.bg },
		CursorColumn = { fg = "NONE", bg = "NONE" },
		CursorLine = { bg = colors.bg3 },
		CursorLineNr = { fg = colors.fg, bg = colors.bg1, bold = true },

		Debug = { fg = colors.fg },
		Define = { fg = colors.blue },
		Delimiter = { fg = colors.gray4 },
		DiffAdd = { fg = colors.green },
		DiffAdded = { fg = colors.green },
		DiffChange = { fg = colors.green },
		DiffDelete = { fg = colors.red },
		DiffRemoved = { fg = colors.red },
		DiffText = { fg = colors.gray14 },
		DiffFile = { fg = colors.pink },

		Error = { fg = colors.red, bg = colors.bg, bold = true },
		ErrorMsg = { fg = colors.bg4, bg = colors.red2, bold = true },
		Exception = { fg = colors.fg },

		Float = { fg = colors.orange },
		FloatBorder = { fg = colors.gray9, bg = "NONE" },
		FoldColumn = { fg = colors.gray6 },
		Folded = { fg = colors.fg, bg = colors.bg4 },
		Function = { fg = colors.green },

		Identifier = { fg = colors.gray14 },
		Ignore = { fg = colors.gray4 },
		IncSearch = { fg = colors.bg, bg = colors.orange },
		Include = { fg = colors.blue, italic = config.italic_keywords == "italic" },

		Keyword = { fg = colors.red, italic = config.italic_keywords == "italic" },

		Label = { fg = colors.red },
		LineNr = { fg = colors.gray6, bg = colors.bg1 },

		Macro = { fg = colors.red, italic = config.italic_keywords == "italic" },
		MatchParen = { fg = colors.gray14, bg = colors.bg2 },
		MatchParenCur = { underline = true },
		MatchWord = { underline = true },
		MatchWordCur = { underline = true },
		ModeMsg = { fg = colors.fg, bg = colors.bg },
		MoreMsg = { fg = colors.orange2 },
		MsgArea = { fg = colors.fg, bg = config.transparent_background and "NONE" or colors.bg },
		MsgSeparator = { fg = colors.fg, bg = colors.bg },

		NonText = { fg = colors.gray9 },
		Normal = { fg = colors.fg, bg = config.transparent_background and "NONE" or colors.bg },
		NormalFloat = { bg = colors.bg2 },
		NormalNC = { fg = colors.fg, bg = config.transparent_background and "NONE" or colors.bg },
		Number = { fg = colors.orange },

		Operator = { fg = colors.fg },
		Pmenu = { fg = colors.gray14, bg = colors.bg2 },
		PmenuSbar = { bg = colors.bg4 },
		PmenuSel = { fg = colors.gray6, bg = colors.bg2 },
		PmenuThumb = { bg = colors.bg2 },
		PreCondit = { fg = colors.blue },
		PreProc = { fg = colors.blue },

		Question = { fg = colors.green },
		QuickFixLine = { fg = colors.orange2 },

		Repeat = { fg = colors.red },

		Search = { fg = colors.gray6, bg = colors.orange },
		SignColumn = { bg = colors.bg1 },
		Special = { fg = colors.gray4 },
		SpecialChar = { fg = colors.yellow },
		SpecialComment = { fg = colors.pink },
		SpecialKey = { fg = colors.gray4, bold = true },
		SpellBad = { fg = colors.red, underline = true },
		SpellCap = { fg = colors.orange, underline = true },
		SpellLocal = { fg = colors.green, underline = true },
		SpellRare = { fg = colors.pink, underline = true },
		Statement = { fg = colors.red },
		StatusLine = { fg = colors.gray6, bg = colors.bg2 },
		StatusLineNC = { fg = colors.gray6, bg = colors.bg2 },
		StatusLineSeparator = { fg = colors.bg2 },
		StatusLineTerm = { fg = colors.green, bg = colors.bg2 },
		StatusLineTermNC = { fg = colors.gray4, bg = colors.bg2 },
		StorageClass = { fg = colors.red },
		String = { fg = colors.yellow },
		Structure = { fg = colors.green },
		Substitute = { fg = colors.gray9, bg = colors.orange },

		TabLine = { fg = colors.gray6 },
		TabLineFill = { fg = colors.gray6 },
		TabLineSel = { fg = colors.fg },
		Tag = { fg = colors.gray4 },
		TermCursor = { fg = colors.fg, bg = colors.gray11 },
		TermCursorNC = { fg = colors.fg, bg = colors.gray11 },
		Title = { fg = colors.gray4 },
		Todo = { fg = colors.yellow, bold = true },
		Type = { fg = colors.blue, italic = config.italic_keywords == "italic" },
		Typedef = { fg = colors.blue, italic = config.italic_keywords == "italic" },

		Variable = { fg = colors.fg },
		VertSplit = { fg = colors.gray2 },
		Visual = { fg = "NONE", bg = colors.bg3, bold = true },
		VisualNOS = { fg = colors.gray3, bg = colors.gray7 },

		WarningMsg = { fg = colors.orange2, bg = colors.bg },
		Whitespace = { fg = colors.gray8 },
		WildMenu = { fg = colors.fg },
		lCursor = { fg = colors.fg, bg = colors.gray11 },

		-- Markdown
		markdownBold = { fg = colors.fg, bold = true },
		markdownCode = { fg = colors.orange },
		markdownCodeBlock = { fg = colors.orange },
		markdownUrl = { fg = colors.pink, underline = true },
		markdownCodeError = { fg = colors.red2 },
		markdownH1 = { fg = colors.fg },
		markdownH2 = { fg = colors.fg },
		markdownH3 = { fg = colors.fg },
		markdownH4 = { fg = colors.fg },
		markdownH5 = { fg = colors.fg },
		markdownH6 = { fg = colors.fg },
		markdownId = { fg = colors.pink },
		markdownItalic = { fg = colors.fg, italic = true },
		markdownLinkText = { fg = colors.fg },
		markdownRule = { fg = colors.gray12 },
		markdownListMarker = { fg = colors.red },
		markdownHeadingDelimiter = { fg = colors.fg },
		markdownHeadingRule = { fg = colors.gray12 },
		markdownUrlTitleDelimiter = { fg = colors.fg },
		markdownCodeSpecial = { fg = colors.orange },
		markdownCodeDelimiter = { fg = colors.green },
		markdownBlockquote = { fg = colors.gray12 },
		markdownIdDeclaration = { fg = colors.fg },
		markdownIdDelimiter = { fg = colors.gray9 },
		markdownLinkDelimiter = { fg = colors.gray9 },
		markdownOrderedListMarker = { fg = colors.red },

		-----------------------------------------
		--   Plugin support
		-----------------------------------------

		-- Buffer
		BufferCurrent = { fg = colors.fg, bg = colors.bg4 },
		BufferCurrentIndex = { fg = colors.fg, bg = colors.bg },
		BufferCurrentMod = { fg = colors.yellow, bg = colors.bg },
		BufferCurrentSign = { fg = colors.blue, bg = colors.bg },
		BufferCurrentTarget = { fg = colors.red, bg = colors.bg, bold = true },
		BufferInactive = { fg = colors.gray9, bg = colors.bg2 },
		BufferInactiveIndex = { fg = colors.gray9, bg = colors.bg2 },
		BufferInactiveMod = { fg = colors.yellow, bg = colors.bg2 },
		BufferInactiveSign = { fg = colors.gray9, bg = colors.bg2 },
		BufferInactiveTarget = { fg = colors.red, bg = colors.bg2, bold = true },
		BufferVisible = { fg = colors.fg, bg = colors.bg },
		BufferVisibleIndex = { fg = colors.fg, bg = colors.bg },
		BufferVisibleMod = { fg = colors.yellow, bg = colors.bg },
		BufferVisibleSign = { fg = colors.green, bg = colors.bg },
		BufferVisibleTarget = { fg = colors.red, bg = colors.bg, bold = true },
		BufferLineFill = { fg = colors.fg, bg = "NONE", bold = true },

		-- WhichKey
		WhichKey = { fg = colors.blue },
		WhichKeySeperator = { fg = colors.red },
		WhichKeyGroup = { fg = colors.pink },
		WhichKeyDesc = { fg = colors.fg },
		WhichKeyFloat = { bg = colors.bg2 },

		-- Cmp
		CmpItemAbbrDeprecated = { fg = colors.gray2 },
		CmpDocumentation = { fg = colors.fg },
		CmpDocumentationBorder = { fg = colors.gray9 },
		CmpItemAbbr = { fg = colors.fg },
		CmpItemAbbrMatch = { fg = colors.blue },
		CmpItemAbbrMatchFuzzy = { fg = colors.blue },
		CmpItemKind = { fg = colors.green },
		CmpItemKindMethod = { fg = colors.blue },
		CmpItemKindConstructor = { fg = colors.yellow },
		CmpItemKindClass = { fg = colors.red },
		CmpItemKindVariable = { fg = colors.fg },
		CmpItemKindField = { fg = colors.fg },
		CmpItemKindProperty = { fg = colors.fg },
		CmpItemKindEnumMember = { fg = colors.orange },
		CmpItemKindConstant = { fg = colors.orange },
		CmpItemKindEnum = { fg = colors.blue },
		CmpItemKindStruct = { fg = colors.blue },
		CmpItemKindKeyword = { fg = colors.pink },
		CmpItemMenu = { fg = colors.pink },
		CmpItemKindOperator = { fg = colors.red },

		-- Dashboard
		DashboardCenter = { fg = colors.fg },
		DashboardFooter = { fg = colors.yellow },
		DashboardHeader = { fg = colors.green },

		-- Debug
		debugBreakpoint = { fg = colors.red, reverse = true },
		debugPc = { bg = colors.gray14 },

		-- Diffview
		DiffViewNormal = { fg = colors.gray9, bg = colors.bg2 },
		DiffviewFilePanelDeletion = { fg = colors.red2 },
		DiffviewFilePanelInsertion = { fg = colors.green2 },
		DiffviewStatusAdded = { fg = colors.green2 },
		DiffviewStatusDeleted = { fg = colors.red2 },
		DiffviewStatusModified = { fg = colors.blue3 },
		DiffviewStatusRenamed = { fg = colors.blue3 },
		DiffviewVertSplit = { bg = colors.bg },

		-- Gitsigns
		GitSignsAdd = { fg = colors.green, bg = colors.bg1 },
		GitSignsChange = { fg = colors.blue3, bg = colors.bg1 },
		GitSignsDelete = { fg = colors.red, bg = colors.bg1 },

		-- GitGutter
		GitGutterAdd = { fg = colors.green2 },
		GitGutterChange = { fg = colors.blue3 },
		GitGutterDelete = { fg = colors.red2 },

		-- Indent-blankline
		IndentBlanklineChar = { fg = colors.bg3 },
		IndentBlanklineContextChar = { fg = colors.gray9 },
		IndentBlanklineSpaceChar = { fg = colors.gray14 },
		IndentBlanklineSpaceCharBlankline = { fg = colors.yellow },

		-- LSP Diagnostics
		DiagnosticVirtualTextInfo = { fg = colors.yellow },
		DiagnosticHint = { fg = colors.blue },
		DiagnosticError = { fg = colors.red2 },
		DiagnosticInfo = { fg = colors.yellow },
		DiagnosticVirtualTextWarn = { fg = colors.orange2 },
		DiagnosticWarn = { fg = colors.orange2 },

		DiagnosticFloatingError = { fg = colors.red2 },
		DiagnosticFloatingHint = { fg = colors.blue },
		DiagnosticFloatingInfo = { fg = colors.yellow },
		DiagnosticFloatingWarn = { fg = colors.orange2 },

		DiagnosticSignError = { fg = colors.red2, bg = colors.bg1 },
		DiagnosticSignHint = { fg = colors.blue, bg = colors.bg1 },
		DiagnosticSignInfo = { fg = colors.yellow, bg = colors.bg1 },
		DiagnosticSignWarn = { fg = colors.orange2, bg = colors.bg1 },

		DiagnosticUnderlineError = { underline = true },
		DiagnosticUnderlineHint = { underline = true },
		DiagnosticUnderlineInfo = { underline = true },
		DiagnosticUnderlineWarn = { underline = true },

		DiagnosticVirtualTextError = { fg = colors.red2 },
		DiagnosticVirtualTextHint = { fg = colors.gray9 },

		-- NERDTree
		Directory = { fg = colors.fg },
		NERDTreeUp = { fg = colors.yellow },
		NERDTreeDir = { fg = colors.blue },
		NERDTreeOpenable = { fg = colors.gray2 },
		NERDTreeClosable = { fg = colors.red },
		NERDTreeIgnore = { fg = colors.gray2 },
		NERDTreeHelpKey = { fg = colors.fg },
		NERDTreeHelpTitle = { fg = colors.pink },
		NERDTreeToggleOn = { fg = colors.green },
		NERDTreeToggleOff = { fg = colors.orange },
		NERDTreeHelpCommand = { fg = colors.yellow },
		NERDTreeFile = { fg = colors.fg },
		NERDTreeLinkTarget = { fg = colors.blue },
		NERDTreeLinkFile = { fg = colors.green },
		NERDTreeLinkDir = { fg = colors.pink },
		NERDTreeNodeDelimiters = { fg = colors.gray2 },
		NERDTreeDirSlash = { fg = colors.gray2 },
		NERDTreeExecFile = { fg = colors.green },
		NERDTreeRO = { fg = colors.orange },
		NERDTreeBookmarkName = { fg = colors.orange },
		NERDTreeFlags = { fg = colors.red },
		NERDTreeCWD = { fg = colors.red },
		NERDTreeBookmarksLeader = { fg = colors.blue },
		NERDTreeBookmarksHeader = { fg = colors.red },
		NERDTreeBookmark = { fg = colors.orange },
		NERDTreePart = { fg = colors.orange },
		NERDTreePartFile = { fg = colors.blue },
		NERDTreeCurrentNode = { fg = colors.gray2 },

		-- Startify
		StartifyEndOfBuffer = { fg = colors.gray8 },
		StartifyNumber = { fg = colors.red },
		StartifySelect = { fg = colors.gray2 },
		StartifyBracket = { fg = colors.fg },
		StartifySpecial = { fg = colors.yellow },
		StartifyVar = { fg = colors.gray2 },
		StartifyPath = { fg = colors.gray2 },
		StartifyFile = { fg = colors.blue },
		StartifySlash = { fg = colors.gray2 },
		StartifyHeader = { fg = colors.blue },
		StartifyFooter = { fg = colors.pink },
		StartifySection = { fg = colors.pink },

		-- Indent Guides
		IndentGuidesEven = { fg = colors.gray14 },
		IndentGuidesOdd = { fg = colors.gray2 },

		-- Flutter Tools
		FlutterWidgetGuides = { fg = colors.gray9 },

		-- Python
		pythonConditional = { fg = colors.red },
		pythonException = { fg = colors.pink },
		pythonFunction = { fg = colors.green },
		pythonInclude = { fg = colors.red },
		pythonOperator = { fg = colors.red },
		pythonStatement = { fg = colors.fg },
		pythonBoolean = { fg = colors.fg },

		-- Neogit
		NeogitBranch = { fg = colors.pink },
		NeogitRemote = { fg = colors.pink },
		NeogitHunkHeader = { fg = colors.gray12, bg = colors.bg2 },
		NeogitDiffContext = { fg = colors.gray12, bg = colors.bg },
		NeogitDiffAdd = { fg = colors.green2, bg = colors.bg2 },
		NeogitDiffDelete = { fg = colors.red2, bg = colors.bg2 },
		NeogitHunkHeaderHighlight = { fg = colors.gray12, bg = colors.bg2 },
		NeogitDiffContextHighlight = { fg = colors.gray12, bg = colors.bg },
		NeogitDiffAddHighlight = { fg = colors.green2, bg = colors.bg2 },
		NeogitDiffDeleteHighlight = { fg = colors.red2, bg = colors.bg2 },

		-- Nvim-tree
		NvimTreeFolderIcon = { fg = colors.orange },
		NvimTreeEmptyFolderName = { fg = colors.yellow, italic = true },
		NvimTreeCursorLine = { fg = colors.gray6, bg = colors.bg3 },
		NvimTreeExecFile = { fg = colors.green },
		NvimTreeFolderName = { fg = colors.gray14 },
		NvimTreeGitDeleted = { fg = colors.red2 },
		NvimTreeGitDirty = { fg = colors.green2 },
		NvimTreeGitMerge = { fg = colors.blue3 },
		NvimTreeGitNew = { fg = colors.green2 },
		NvimTreeGitRenamed = { fg = colors.blue3 },
		NvimTreeGitStaged = { fg = colors.green2 },
		NvimTreeImageFile = { fg = colors.pink },
		NvimTreeIndentMarker = { fg = colors.gray2 },
		NvimTreeNormal = { fg = colors.gray14, bg = colors.bg2 },
		NvimTreeNormalNC = { bg = colors.bg2 },
		NvimTreeOpenedFolderName = { fg = colors.gray14, italic = true },
		NvimTreeRootFolder = { fg = colors.yellow, bold = true },
		NvimTreeSpecialFile = { fg = colors.orange },
		NvimTreeSymlink = { fg = colors.yellow },
		NvimTreeVertSplit = { fg = colors.bg2 },
		NvimTreeEndOfBuffer = { fg = colors.gray8 },

		-- Telescope
		TelescopeBorder = { fg = colors.fg, bg = config.transparent_background and "NONE" or colors.bg },
		TelescopeMatching = { fg = colors.yellow },
		TelescopePromptPrefix = { fg = colors.green },
		TelescopeSelection = { fg = colors.gray2, bg = colors.bg3 },

		-- Trouble
		TroubleTextInformation = { fg = colors.blue },
		TroubleFile = { fg = colors.yellow },
		TroubleFoldIcon = { fg = colors.blue },
		TroubleCount = { fg = colors.red },
		TroubleError = { fg = colors.red, bg = colors.gray6 },
		TroubleTextError = { fg = colors.red },
		TroubleNormal = { fg = colors.fg },
		TroubleLocation = { fg = colors.fg },
		TroubleIndent = { fg = colors.gray2 },
		TroubleCode = { fg = colors.orange2 },
		TroubleSignError = { fg = colors.red },
		TroubleSignWarning = { fg = colors.orange2 },
		TroubleWarning = { fg = colors.orange2 },
		TroublePreview = { fg = colors.red },
		TroubleSignInformation = { fg = colors.fg },
		TroubleSource = { fg = colors.blue },
		TroubleSignHint = { fg = colors.green },
		TroubleSignOther = { fg = colors.green },
		TroubleTextWarning = { fg = colors.orange2 },
		TroubleInformation = { fg = colors.fg },
		TroubleHint = { fg = colors.orange2 },
		TroubleTextHint = { fg = colors.fg },
		TroubleText = { fg = colors.fg },

		-- CodeActionMenu
		CodeActionMenuWarningMessageText = { fg = colors.orange2 },
		CodeActionMenuWarningMessageBorder = { fg = colors.red },
		CodeActionMenuMenuIndex = { fg = colors.blue },
		CodeActionMenuMenuKind = { fg = colors.green },
		CodeActionMenuMenuTitle = { fg = colors.fg },
		CodeActionMenuMenuDisabled = { fg = colors.gray2 },
		CodeActionMenuMenuSelection = { fg = colors.blue },
		CodeActionMenuDetailsTitle = { fg = colors.fg },
		CodeActionMenuDetailsLabel = { fg = colors.yellow },
		CodeActionMenuDetailsPreferred = { fg = colors.green },
		CodeActionMenuDetailsDisabled = { fg = colors.gray2 },
		CodeActionMenuDetailsUndefined = { fg = colors.gray2 },

		-- CMake
		cmakeCommand = { fg = colors.fg },
		cmakeArguments = { fg = colors.fg },
		cmakeKWvariable_watch = { fg = colors.fg },
		cmakeKWproject = { fg = colors.pink },
		cmakeGeneratorExpressions = { fg = colors.pink },
		cmakeVariable = { fg = colors.fg },
		cmakeKWuse_mangled_mesa = { fg = colors.fg, italic = true },

		-- TreeSitter
		TSAnnotation = { fg = colors.yellow },
		TSAttribute = { fg = colors.fg },
		TSBoolean = { fg = colors.orange, italic = config.italic_booleans == "italic" },
		TSCharacter = { fg = colors.yellow },
		TSCharacterSpecial = { fg = colors.yellow },
		TSComment = { fg = colors.gray2, italic = config.italic_comments == "italic" },
		TSConditional = { fg = colors.red, italic = config.italic_keywords == "italic" },
		TSConstBuiltin = { fg = colors.pink },
		TSConstMacro = { fg = colors.blue },
		TSConstant = { fg = colors.pink },
		TSConstructor = { fg = colors.fg },
		TSEmphasis = { italic = true },
		TSError = { fg = colors.red2, bg = colors.bg, bold = true },
		TSException = { fg = colors.red },
		TSField = { fg = colors.fg },
		TSFloat = { fg = colors.orange },
		TSFuncBuiltin = { fg = colors.green, italic = config.italic_functions },
		TSFuncMacro = { fg = colors.blue, italic = config.italic_functions },
		TSFunction = { fg = colors.green, italic = config.italic_functions },
		TSInclude = { fg = colors.red },
		TSKeyword = { fg = colors.red, italic = config.italic_keywords == "italic" },
		TSKeywordFunction = { fg = colors.red, italic = config.italic_functions },
		TSKeywordOperator = { fg = colors.red },
		TSKeywordReturn = { fg = colors.red, italic = config.italic_keywords == "italic" },
		TSNone = { fg = colors.orange },
		TSLabel = { fg = colors.pink },
		TSLiteral = { fg = colors.yellow },
		TSMethod = { fg = colors.green, italic = config.italic_functions },
		TSNamespace = { fg = colors.blue },
		TSNumber = { fg = colors.orange },
		TSOperator = { fg = colors.red },
		TSParameter = { fg = colors.fg },
		TSParameterReference = { fg = colors.fg },
		TSProperty = { fg = colors.fg },
		TSPunctBracket = { fg = colors.fg },
		TSPunctDelimiter = { fg = colors.fg },
		TSPunctSpecial = { fg = colors.gray4 },
		TSQueryLinterError = { fg = colors.red2 },
		TSRepeat = { fg = colors.red, italic = config.italic_keywords == "italic" },
		TSString = { fg = colors.yellow },
		TSStringEscape = { fg = colors.green },
		TSStringRegex = { fg = colors.yellow },
		TSStrong = { fg = colors.yellow },
		TSStructure = { fg = colors.red },
		TSSymbol = { fg = colors.fg },
		TSTag = { fg = colors.red },
		TSTagDelimiter = { fg = colors.gray4 },
		TSText = { fg = colors.fg },
		TSTitle = { fg = colors.fg, bold = true },
		TSType = { fg = colors.blue },
		TSTypeBuiltin = { fg = colors.blue },
		TSTodo = { fg = colors.orange },
		TSTypeQualifier = { fg = colors.red },
		TSURI = { fg = colors.yellow, underline = true },
		TSUnderline = { underline = true },
		TSVariable = { fg = colors.fg, italic = config.italic_variables },
		TSVariableBuiltin = { fg = colors.pink, italic = config.italic_variables },
		TSDefine = { fg = colors.red },

		-- Modern TreeSitter groups (@-prefixed)
		["@annotation"] = { fg = colors.yellow },
		["@attribute"] = { fg = colors.fg },
		["@boolean"] = { fg = colors.orange, italic = config.italic_booleans == "italic" },
		["@character"] = { fg = colors.yellow },
		["@character.special"] = { fg = colors.yellow },
		["@comment"] = { fg = colors.gray2, italic = config.italic_comments == "italic" },
		["@conditional"] = { fg = colors.red, italic = config.italic_keywords == "italic" },
		["@constant"] = { fg = colors.pink },
		["@constant.builtin"] = { fg = colors.pink },
		["@constant.macro"] = { fg = colors.blue },
		["@constructor"] = { fg = colors.fg },
		["@emphasis"] = { italic = true },
		["@error"] = { fg = colors.red2, bg = colors.bg, bold = true },
		["@exception"] = { fg = colors.red },
		["@field"] = { fg = colors.fg },
		["@float"] = { fg = colors.orange },
		["@function"] = { fg = colors.green, italic = config.italic_functions },
		["@function.builtin"] = { fg = colors.green, italic = config.italic_functions },
		["@function.macro"] = { fg = colors.blue, italic = config.italic_functions },
		["@include"] = { fg = colors.red },
		["@keyword"] = { fg = colors.red, italic = config.italic_keywords == "italic" },
		["@keyword.function"] = { fg = colors.red, italic = config.italic_functions },
		["@keyword.operator"] = { fg = colors.red },
		["@keyword.return"] = { fg = colors.red, italic = config.italic_keywords == "italic" },
		["@label"] = { fg = colors.pink },
		["@method"] = { fg = colors.green, italic = config.italic_functions },
		["@namespace"] = { fg = colors.blue },
		["@none"] = { fg = colors.orange },
		["@number"] = { fg = colors.orange },
		["@operator"] = { fg = colors.red },
		["@parameter"] = { fg = colors.fg },
		["@parameter.reference"] = { fg = colors.fg },
		["@property"] = { fg = colors.fg },
		["@punctuation.bracket"] = { fg = colors.fg },
		["@punctuation.delimiter"] = { fg = colors.fg },
		["@punctuation.special"] = { fg = colors.gray4 },
		["@repeat"] = { fg = colors.red, italic = config.italic_keywords == "italic" },
		["@string"] = { fg = colors.green },
		["@string.escape"] = { fg = colors.green },
		["@string.regex"] = { fg = colors.yellow },
		["@string.special"] = { fg = colors.yellow },
		["@symbol"] = { fg = colors.fg },
		["@tag"] = { fg = colors.red },
		["@tag.delimiter"] = { fg = colors.gray4 },
		["@text"] = { fg = colors.fg },
		["@text.strong"] = { fg = colors.yellow },
		["@text.title"] = { fg = colors.fg, bold = true },
		["@text.uri"] = { fg = colors.yellow, underline = true },
		["@text.underline"] = { underline = true },
		["@type"] = { fg = colors.blue },
		["@type.builtin"] = { fg = colors.blue },
		["@type.qualifier"] = { fg = colors.red },
		["@variable"] = { fg = colors.fg, italic = config.italic_variables },
		["@variable.builtin"] = { fg = colors.pink, italic = config.italic_variables },
	}

	-- Apply on_highlights callback if provided
	if opts.on_highlights and type(opts.on_highlights) == "function" then
		opts.on_highlights(highlights, colors)
	end

	-- Apply all highlights
	for group, hl_opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl_opts)
	end
end

return M
