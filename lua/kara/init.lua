local M = {}

-- Color palette
M.colors = {
	-- Base colors
	fg = "#DFE0EA",
	bg = "#2b2e36",

	-- Background variants
	bg2 = "#22252a", -- dark, black
	bg3 = "#3d4f6d", -- visual selection, cursor line

	-- Foreground/Gray variants
	gray1 = "#6B7A94", -- darkest - comments, borders, inactive elements
	gray2 = "#8B9AAF", -- medium - line numbers, delimiters, secondary text
	gray3 = "#C6D0E0", -- lightest - active text, important UI elements

	-- Primary colors
	purple = "#6a4c93",
	pink = "#D895C7",
	red = "#E85A84",
	red2 = "#D95555",
	orange = "#E0828D",
	orange2 = "#FAB387",
	yellow = "#EED49F",
	green = "#A6DB95",
	green2 = "#52b788",
	blue3 = "#CAF0F8",
	blue2 = "#6CAEC0",
	blue = "#7EB7E6",
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
		ColorColumn = { bg = colors.bg2 },
		Comment = { fg = colors.gray1, italic = config.italic_comments == "italic" },
		Conceal = { fg = colors.fg },
		Conditional = { fg = colors.pink },
		Constant = { fg = colors.orange },
		Cursor = { fg = colors.bg, bg = colors.orange },
		CursorIM = { fg = colors.bg, bg = colors.orange },
		CursorColumn = { bg = colors.bg2 },
		CursorLine = { bg = colors.bg2 },
		CursorLineNr = { fg = colors.yellow, bg = colors.bg2, bold = true },
		CursorLineFold = { link = "FoldColumn" },
		CursorLineSign = { link = "SignColumn" },

		Debug = { fg = colors.fg },
		Define = { fg = colors.blue },
		Delimiter = { fg = colors.gray3 },
		DiffAdd = { bg = colors.bg3 },
		DiffChange = { bg = colors.bg3 },
		DiffDelete = { bg = colors.bg3 },
		DiffText = { bg = colors.bg3 },
		diffAdded = { fg = colors.green },
		diffRemoved = { fg = colors.red },
		diffChanged = { fg = colors.blue },
		diffOldFile = { fg = colors.yellow },
		diffNewFile = { fg = colors.orange2 },
		diffFile = { fg = colors.blue },
		diffLine = { fg = colors.gray1 },
		diffIndexLine = { fg = colors.blue2 },
		Directory = { fg = colors.blue },

		Error = { fg = colors.red2, bg = colors.bg, bold = true },
		ErrorMsg = { fg = colors.red2, bg = "NONE", bold = true },
		Exception = { fg = colors.fg },

		Float = { fg = colors.orange },
		FloatBorder = { fg = colors.blue, bg = "NONE" },
		FloatTitle = { fg = colors.gray3, bold = true },
		FloatFooter = { link = "FloatTitle" },
		FoldColumn = { fg = colors.gray1 },
		Folded = { fg = colors.blue, bg = colors.bg3 },
		Function = { fg = colors.blue },

		Identifier = { fg = colors.gray3 },
		Ignore = { fg = colors.gray3 },
		IncSearch = { fg = colors.fg, bg = colors.gray1 },
		Include = { fg = colors.blue, italic = config.italic_keywords == "italic" },

		Keyword = { fg = colors.pink, italic = config.italic_keywords == "italic" },

		Label = { fg = colors.pink },
		LineNr = { fg = colors.gray2, bg = colors.bg },
		LineNrAbove = { link = "LineNr" },
		LineNrBelow = { link = "LineNr" },

		Macro = { fg = colors.red, italic = config.italic_keywords == "italic" },
		MatchParen = { fg = colors.orange2, bg = colors.bg3, bold = true },
		MatchParenCur = { underline = true },
		MatchWord = { underline = true },
		MatchWordCur = { underline = true },
		ModeMsg = { fg = colors.fg, bold = true },
		MoreMsg = { fg = colors.blue },
		MsgArea = { fg = colors.fg, bg = config.transparent_background and "NONE" or colors.bg },
		MsgSeparator = { fg = colors.gray2, bg = colors.bg },

		NonText = { fg = colors.gray2 },
		Normal = { fg = colors.fg, bg = config.transparent_background and "NONE" or colors.bg },
		NormalFloat = { fg = colors.fg, bg = colors.bg2 },
		NormalNC = { fg = colors.fg, bg = config.transparent_background and "NONE" or colors.bg },
		NormalSB = { fg = colors.fg, bg = colors.bg2 },
		Number = { fg = colors.orange },

		Operator = { fg = colors.blue2 },
		Pmenu = { fg = colors.gray2, bg = colors.bg2 },
		PmenuSbar = { bg = colors.bg3 },
		PmenuSel = { bg = colors.bg3, bold = true },
		PmenuKind = { link = "Pmenu" },
		PmenuKindSel = { link = "PmenuSel" },
		PmenuExtra = { fg = colors.gray1 },
		PmenuExtraSel = { fg = colors.gray1, bg = colors.bg3, bold = true },
		PmenuMatch = { fg = colors.fg, bold = true },
		PmenuMatchSel = { bold = true },
		PmenuThumb = { bg = colors.gray1 },
		PreCondit = { fg = colors.blue },
		PreProc = { fg = colors.blue },

		Question = { fg = colors.blue },
		QuickFixLine = { bg = colors.bg3, bold = true },

		Repeat = { fg = colors.pink },

		Search = { fg = colors.fg, bg = colors.bg3 },
		CurSearch = { fg = colors.bg2, bg = colors.red },
		SignColumn = { fg = colors.bg3, bg = colors.bg },
		SignColumnSB = { fg = colors.bg3, bg = colors.bg2 },
		Special = { fg = colors.gray3 },
		SpecialChar = { fg = colors.yellow },
		SpecialComment = { fg = colors.pink },
		SpecialKey = { fg = colors.gray3, bold = true },
		SpellBad = { sp = colors.red, undercurl = true },
		SpellCap = { sp = colors.yellow, undercurl = true },
		SpellLocal = { sp = colors.blue, undercurl = true },
		SpellRare = { sp = colors.green, undercurl = true },
		Statement = { fg = colors.pink },
		StatusLine = { fg = colors.gray2, bg = "NONE" },
		StatusLineNC = { fg = colors.gray2, bg = colors.bg2 },
		StatusLineSeparator = { fg = colors.bg2 },
		StatusLineTerm = { fg = colors.green, bg = colors.bg2 },
		StatusLineTermNC = { fg = colors.gray3, bg = colors.bg2 },
		StorageClass = { fg = colors.pink },
		String = { fg = colors.green },
		Structure = { fg = colors.green },
		Substitute = { fg = colors.gray2, bg = colors.orange },

		TabLine = { fg = colors.gray2 },
		TabLineFill = { fg = colors.gray2 },
		TabLineSel = { fg = colors.fg },
		Tag = { fg = colors.gray3 },
		TermCursor = { fg = colors.fg, bg = colors.gray3 },
		TermCursorNC = { fg = colors.fg, bg = colors.gray3 },
		Title = { fg = colors.blue, bold = true },
		Todo = { fg = colors.yellow, bold = true },
		Type = { fg = colors.blue, italic = config.italic_keywords == "italic" },
		Typedef = { fg = colors.blue, italic = config.italic_keywords == "italic" },

		Variable = { fg = colors.blue3 },
		VertSplit = { fg = colors.bg2 },
		WinSeparator = { fg = colors.bg2 },
		WinBar = { fg = colors.orange },
		WinBarNC = { link = "WinBar" },
		Visual = { bg = colors.bg3, bold = true },
		VisualNOS = { bg = colors.bg3, bold = true },

		WarningMsg = { fg = colors.orange2, bg = "NONE" },
		Whitespace = { fg = colors.bg3 },
		WildMenu = { fg = colors.fg },
		lCursor = { fg = colors.fg, bg = colors.gray3 },
		YankHighlight = { fg = colors.bg, bg = colors.orange },

		-- Markdown
		markdownBold = { fg = colors.red, bold = true },
		markdownCode = { fg = colors.orange },
		markdownCodeBlock = { fg = colors.orange },
		markdownUrl = { fg = colors.blue, underline = true, italic = true },
		markdownCodeError = { fg = colors.red2 },
		markdownH1 = { fg = colors.red, bold = true },
		markdownH2 = { fg = colors.orange2, bold = true },
		markdownH3 = { fg = colors.yellow, bold = true },
		markdownH4 = { fg = colors.green, bold = true },
		markdownH5 = { fg = colors.blue, bold = true },
		markdownH6 = { fg = colors.pink, bold = true },
		markdownId = { fg = colors.pink },
		markdownItalic = { fg = colors.red, italic = true },
		markdownLinkText = { fg = colors.blue, underline = true },
		markdownRule = { fg = colors.gray1 },
		markdownListMarker = { fg = colors.blue2 },
		markdownHeadingDelimiter = { fg = colors.orange2, bold = true },
		markdownHeadingRule = { fg = colors.gray1 },
		markdownUrlTitleDelimiter = { fg = colors.fg },
		markdownCodeSpecial = { fg = colors.orange },
		markdownCodeDelimiter = { fg = colors.green },
		markdownBlockquote = { fg = colors.pink },
		markdownIdDeclaration = { fg = colors.fg },
		markdownIdDelimiter = { fg = colors.gray2 },
		markdownLinkDelimiter = { fg = colors.gray2 },
		markdownOrderedListMarker = { fg = colors.blue2 },
		mkdCodeDelimiter = { fg = colors.fg, bg = colors.bg },
		mkdCodeStart = { fg = colors.orange, bold = true },
		mkdCodeEnd = { fg = colors.orange, bold = true },
		htmlH1 = { fg = colors.pink, bold = true },
		htmlH2 = { fg = colors.blue, bold = true },

		-----------------------------------------
		--   Plugin support
		-----------------------------------------

		-- Buffer
		BufferCurrent = { fg = colors.fg, bg = colors.bg2 },
		BufferCurrentIndex = { fg = colors.fg, bg = colors.bg },
		BufferCurrentMod = { fg = colors.yellow, bg = colors.bg },
		BufferCurrentSign = { fg = colors.blue, bg = colors.bg },
		BufferCurrentTarget = { fg = colors.red, bg = colors.bg, bold = true },
		BufferInactive = { fg = colors.gray2, bg = colors.bg2 },
		BufferInactiveIndex = { fg = colors.gray2, bg = colors.bg2 },
		BufferInactiveMod = { fg = colors.yellow, bg = colors.bg2 },
		BufferInactiveSign = { fg = colors.gray2, bg = colors.bg2 },
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
		CmpItemAbbrDeprecated = { fg = colors.gray1 },
		CmpDocumentation = { fg = colors.fg },
		CmpDocumentationBorder = { fg = colors.gray2 },
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

		-- Blink.cmp
		BlinkCmpMenu = { fg = colors.gray14, bg = colors.bg2 },
		BlinkCmpMenuBorder = { fg = colors.gray1, bg = colors.bg2 },
		BlinkCmpMenuSelection = { bg = colors.bg2, bold = true },
		BlinkCmpScrollBarThumb = { bg = colors.gray2 },
		BlinkCmpScrollBarGutter = { bg = colors.gray2 },

		BlinkCmpLabel = { fg = colors.gray3 },
		BlinkCmpLabelDeprecated = { fg = colors.gray2, strikethrough = true },
		BlinkCmpLabelMatch = { fg = colors.blue, bold = true },
		BlinkCmpLabelDetail = { fg = colors.gray3 },
		BlinkCmpLabelDescription = { fg = colors.gray3 },

		BlinkCmpGhostText = { fg = colors.gray3 },

		BlinkCmpDoc = { fg = colors.fg, bg = colors.bg2 },
		BlinkCmpDocBorder = { fg = colors.gray3, bg = colors.bg2 },
		BlinkCmpDocSeparator = { fg = colors.gray3, bg = colors.bg2 },
		BlinkCmpDocCursorLine = { bg = colors.bg2 },

		BlinkCmpSignatureHelp = { fg = colors.fg, bg = colors.bg2 },
		BlinkCmpSignatureHelpBorder = { fg = colors.gray3, bg = colors.bg2 },
		BlinkCmpSignatureHelpActiveParameter = { fg = colors.yellow, bold = true },

		BlinkCmpSource = { fg = colors.pink },

		-- Blink.cmp Kind highlights
		BlinkCmpKind = { fg = colors.blue },
		BlinkCmpKindClass = { fg = colors.yellow },
		BlinkCmpKindColor = { fg = colors.red },
		BlinkCmpKindConstant = { fg = colors.orange },
		BlinkCmpKindConstructor = { fg = colors.blue },
		BlinkCmpKindEnum = { fg = colors.yellow },
		BlinkCmpKindEnumMember = { fg = colors.blue2 },
		BlinkCmpKindEvent = { fg = colors.blue },
		BlinkCmpKindField = { fg = colors.green },
		BlinkCmpKindFile = { fg = colors.blue },
		BlinkCmpKindFolder = { fg = colors.blue },
		BlinkCmpKindFunction = { fg = colors.blue },
		BlinkCmpKindInterface = { fg = colors.yellow },
		BlinkCmpKindKeyword = { fg = colors.pink },
		BlinkCmpKindMethod = { fg = colors.blue },
		BlinkCmpKindModule = { fg = colors.blue },
		BlinkCmpKindOperator = { fg = colors.blue2 },
		BlinkCmpKindProperty = { fg = colors.blue },
		BlinkCmpKindReference = { fg = colors.red },
		BlinkCmpKindSnippet = { fg = colors.red },
		BlinkCmpKindStruct = { fg = colors.blue },
		BlinkCmpKindText = { fg = colors.green },
		BlinkCmpKindTypeParameter = { fg = colors.red },
		BlinkCmpKindUnit = { fg = colors.green },
		BlinkCmpKindValue = { fg = colors.orange },
		BlinkCmpKindVariable = { fg = colors.red },
		BlinkCmpKindCopilot = { fg = colors.blue2 },

		-- Snacks.nvim - Dashboard
		SnacksDashboardNormal = { fg = colors.gray1 },
		SnacksDashboardDesc = { fg = colors.fg },
		SnacksDashboardDir = { fg = colors.gray2 },
		SnacksDashboardFile = { fg = colors.fg },
		SnacksDashboardTerminal = { fg = colors.fg },
		SnacksDashboardHeader = { fg = colors.gray1, bold = true },
		SnacksDashboardTitle = { fg = colors.gray1, bold = true },
		SnacksDashboardIcon = { fg = colors.gray1 },
		SnacksDashboardKey = { fg = colors.gray1 },
		SnacksDashboardFooter = { fg = colors.gray1, italic = true },
		SnacksDashboardSpecial = { fg = colors.yellow },

		-- Snacks.nvim - Picker
		SnacksPicker = { fg = colors.fg, bg = colors.bg },
		SnacksPickerBorder = { fg = colors.gray1, bg = "NONE" },
		SnacksPickerTitle = { fg = colors.fg, bg = "NONE" },
		SnacksPickerCursorLine = { bg = colors.bg2 },
		SnacksPickerListCursorLine = { bg = colors.bg2, bold = true },
		SnacksPickerPreviewCursorLine = { bg = colors.bg2, bold = true },
		SnacksPickerSearch = { fg = colors.fg, bg = colors.bg },
		SnacksPickerPickWin = { fg = colors.gray2, bg = colors.orange },
		SnacksPickerPickWinCurrent = { fg = colors.bg, bg = colors.orange },
		SnacksPickerMatch = { fg = colors.orange2, bold = true },
		SnacksPickerPrompt = { fg = colors.fg, bg = colors.bg },
		SnacksPickerSpinner = { fg = colors.gray2 },
		SnacksPickerSpecial = { fg = colors.gray2 },

		SnacksPickerDir = { fg = colors.gray3 },
		SnacksPickerDirectory = { fg = colors.fg },
		SnacksPickerDimmed = { fg = colors.fg },
		SnacksPickerBold = { bold = true },
		SnacksPickerItalic = { italic = true },
		SnacksPickerDelim = { fg = colors.gray2 },

		SnacksPickerTree = { fg = colors.gray2 },
		SnacksPickerCol = { fg = colors.gray2 },
		SnacksPickerRow = { fg = colors.yellow },
		SnacksPickerIdx = { fg = colors.orange },
		SnacksPickerSelected = { fg = colors.orange },
		SnacksPickerUnselected = { fg = colors.gray3 },
		SnacksPickerTotals = { fg = colors.gray3 },
		SnacksPickerToggle = { fg = colors.yellow },

		SnacksPickerIcon = { fg = colors.gray2, bg = "NONE" },
		SnacksPickerIconFile = { fg = colors.fg },
		SnacksPickerIconEvent = { fg = colors.gray2 },
		SnacksPickerIconArray = { fg = colors.fg },
		SnacksPickerIconCategory = { fg = colors.blue },
		SnacksPickerIconConstructor = { fg = colors.fg },
		SnacksPickerIconEnumMember = { fg = colors.blue2 },
		SnacksPickerIconField = { fg = colors.fg },
		SnacksPickerIconModule = { fg = colors.blue },
		SnacksPickerIconNamespace = { fg = colors.blue },
		SnacksPickerIconNull = { fg = colors.pink },
		SnacksPickerIconPackage = { fg = colors.blue },
		SnacksPickerIconProperty = { fg = colors.fg },
		SnacksPickerIconVariable = { fg = colors.fg },

		SnacksPickerDesc = { fg = colors.gray2 },
		SnacksPickerComment = { fg = colors.gray2 },
		SnacksPickerLink = { fg = colors.gray2 },
		SnacksPickerLinkBroken = { fg = colors.red2 },

		SnacksPickerPathHidden = { fg = colors.gray3 },
		SnacksPickerPathIgnored = { fg = colors.gray3 },
		SnacksPickerBufFlags = { fg = colors.gray3 },
		SnacksPickerBufNr = { fg = colors.orange },
		SnacksPickerBufType = { fg = colors.green },
		SnacksPickerFileType = { fg = colors.blue },

		SnacksPickerCmd = { fg = colors.green },
		SnacksPickerCmdBuiltin = { fg = colors.fg },

		SnacksPickerKeymapMode = { fg = colors.orange },
		SnacksPickerKeymapLhs = { fg = colors.gray2 },
		SnacksPickerKeymapRhs = { fg = colors.gray3 },
		SnacksPickerKeymapNowait = { fg = colors.pink },
		SnacksPickerRegister = { fg = colors.orange },

		SnacksPickerAuEvent = { fg = colors.pink },
		SnacksPickerAuGroup = { fg = colors.blue },
		SnacksPickerAuPattern = { fg = colors.yellow },

		SnacksPickerTime = { fg = colors.gray2 },

		SnacksPickerManPage = { fg = colors.gray2 },
		SnacksPickerManSection = { fg = colors.orange },

		SnacksPickerDiagnosticCode = { fg = colors.gray2 },
		SnacksPickerDiagnosticSource = { fg = colors.gray2 },

		SnacksPickerLspEnabled = { fg = colors.gray2 },
		SnacksPickerLspAttached = { fg = colors.orange2 },
		SnacksPickerLspAttachedBuf = { fg = colors.yellow },
		SnacksPickerLspDisabled = { fg = colors.orange2 },
		SnacksPickerLspUnavailable = { fg = colors.red2 },

		SnacksPickerGitStatus = { fg = colors.gray2 },
		SnacksPickerGitStatusAdded = { fg = colors.green2 },
		SnacksPickerGitStatusDeleted = { fg = colors.red },
		SnacksPickerGitStatusIgnored = { fg = colors.gray3 },
		SnacksPickerGitStatusModified = { fg = colors.orange2 },
		SnacksPickerGitStatusStaged = { fg = colors.blue },
		SnacksPickerGitStatusUnmerged = { fg = colors.red2 },
		SnacksPickerGitStatusUntracked = { fg = colors.gray3 },
		SnacksPickerGitType = { fg = colors.gray3 },
		SnacksPickerGitBranch = { fg = colors.gray3 },
		SnacksPickerGitBranchCurrent = { fg = colors.orange },
		SnacksPickerGitCommit = { fg = colors.pink },
		SnacksPickerGitAuthor = { fg = colors.pink },
		SnacksPickerGitDate = { fg = colors.gray2 },
		SnacksPickerGitDetached = { fg = colors.orange2 },
		SnacksPickerGitIssue = { fg = colors.orange },
		SnacksPickerGitScope = { italic = true },
		SnacksPickerGitBreaking = { fg = colors.red, bold = true },

		SnacksPickerUndoAdded = { fg = colors.green2 },
		SnacksPickerUndoRemoved = { fg = colors.red },
		SnacksPickerUndoCurrent = { fg = colors.pink },
		SnacksPickerUndoSaved = { fg = colors.gray2 },

		-- Snacks.nvim - Input
		SnacksInputNormal = { fg = colors.fg, bg = colors.bg },
		SnacksInputBorder = { fg = colors.yellow, bg = colors.bg },
		SnacksInputTitle = { fg = colors.yellow, bg = colors.bg },
		SnacksInputIcon = { fg = colors.blue },

		-- Snacks.nvim - Indent
		SnacksIndent = { fg = colors.gray2 },
		SnacksIndentScope = { fg = colors.red },
		SnacksIndent1 = { fg = colors.yellow },
		SnacksIndent2 = { fg = colors.blue },
		SnacksIndent3 = { fg = colors.orange2 },
		SnacksIndent4 = { fg = colors.red2 },
		SnacksIndent5 = { fg = colors.yellow },
		SnacksIndent6 = { fg = colors.blue },
		SnacksIndent7 = { fg = colors.orange2 },
		SnacksIndent8 = { fg = colors.red2 },

		-- Snacks.nvim - Footer
		SnacksFooterDesc = { fg = colors.yellow },
		SnacksFooterKey = { fg = colors.yellow },

		-- Snacks.nvim - StatusColumn
		SnacksStatusColumnMark = { fg = colors.blue },

		-- Snacks.nvim - Win
		SnacksWinBar = { fg = colors.gray3 },
		SnacksWinKey = { fg = colors.red },
		SnacksWinKeyDesc = { fg = colors.green },
		SnacksWinKeySep = { fg = colors.gray3 },
		SnacksWinSeparator = { fg = colors.gray2 },

		-- Snacks.nvim - Image
		SnacksImageAnchor = { fg = colors.gray2 },
		SnacksImageLoading = { fg = colors.gray3 },
		SnacksImageMath = { fg = colors.pink },
		SnacksImageSpinner = { fg = colors.gray2 },

		-- Snacks.nvim - Normal & Backdrop
		SnacksNormal = { fg = colors.fg, bg = colors.bg },
		SnacksNormalNC = { fg = colors.fg, bg = colors.bg },
		SnacksTitle = { fg = colors.blue, bg = "NONE" },
		SnacksBackdrop = { bg = "#000000" },

		-- Mini.nvim plugins
		-- Mini.icons
		MiniIconsAzure = { fg = colors.blue2 },
		MiniIconsBlue = { fg = colors.blue },
		MiniIconsCyan = { fg = colors.blue2 },
		MiniIconsGreen = { fg = colors.green },
		MiniIconsGrey = { fg = colors.fg },
		MiniIconsOrange = { fg = colors.orange2 },
		MiniIconsPurple = { fg = colors.pink },
		MiniIconsRed = { fg = colors.red },
		MiniIconsYellow = { fg = colors.yellow },

		-- Mini.hipatterns
		MiniHipatternsFixme = { fg = colors.bg, bg = colors.red, bold = true },
		MiniHipatternsHack = { fg = colors.bg, bg = colors.yellow, bold = true },
		MiniHipatternsTodo = { fg = colors.bg, bg = colors.blue2, bold = true },
		MiniHipatternsNote = { fg = colors.bg, bg = colors.blue2, bold = true },

		-- Mini.diff
		MiniDiffSignAdd = { fg = colors.green, bg = colors.bg },
		MiniDiffSignChange = { fg = colors.yellow, bg = colors.bg },
		MiniDiffSignDelete = { fg = colors.red, bg = colors.bg },
		MiniDiffOverAdd = { fg = colors.green },
		MiniDiffOverChange = { fg = colors.yellow },
		MiniDiffOverContext = { fg = colors.gray2 },
		MiniDiffOverDelete = { fg = colors.red },

		-- Mini.statusline
		MiniStatuslineModeNormal = { fg = colors.bg2, bg = colors.blue, bold = true },
		MiniStatuslineModeInsert = { fg = colors.bg, bg = colors.green, bold = true },
		MiniStatuslineModeVisual = { fg = colors.bg, bg = colors.pink, bold = true },
		MiniStatuslineModeReplace = { fg = colors.bg, bg = colors.red, bold = true },
		MiniStatuslineModeCommand = { fg = colors.bg, bg = colors.orange2, bold = true },
		MiniStatuslineModeOther = { fg = colors.bg, bg = colors.blue2, bold = true },
		MiniStatuslineDevinfo = { fg = colors.gray3, bg = colors.gray2 },
		MiniStatuslineFileinfo = { fg = colors.gray3, bg = colors.gray2 },
		MiniStatuslineFilename = { fg = colors.fg, bg = colors.bg2 },
		MiniStatuslineInactive = { fg = colors.blue, bg = colors.bg2 },

		-- Mini.tabline
		MiniTablineCurrent = {
			fg = colors.fg,
			bg = colors.bg,
			bold = true,
			italic = true,
			underline = true,
			sp = colors.red,
		},
		MiniTablineVisible = { fg = colors.fg, bg = colors.bg },
		MiniTablineHidden = { fg = colors.fg, bg = colors.bg2 },
		MiniTablineModifiedCurrent = { fg = colors.red, bold = true, italic = true },
		MiniTablineModifiedVisible = { fg = colors.red },
		MiniTablineModifiedHidden = { fg = colors.red },
		MiniTablineFill = { bg = colors.bg },
		MiniTablineTabpagesection = { fg = colors.gray2, bg = colors.bg },

		-- Mini.starter
		MiniStarterCurrent = { underline = true },
		MiniStarterFooter = { fg = colors.yellow, italic = true },
		MiniStarterHeader = { fg = colors.blue },
		MiniStarterInactive = { fg = colors.gray1, italic = true },
		MiniStarterItem = { fg = colors.fg },
		MiniStarterItemBullet = { fg = colors.blue },
		MiniStarterItemPrefix = { fg = colors.pink },
		MiniStarterSection = { fg = colors.orange2 },
		MiniStarterQuery = { fg = colors.green },

		-- Mini.pick
		MiniPickBorder = { fg = colors.gray2, bg = colors.bg2 },
		MiniPickBorderBusy = { fg = colors.orange2, bg = colors.bg2 },
		MiniPickBorderText = { fg = colors.pink, bg = colors.bg2 },
		MiniPickHeader = { fg = colors.blue },
		MiniPickIconDirectory = { fg = colors.fg },
		MiniPickIconFile = { fg = colors.fg },
		MiniPickMatchCurrent = { fg = colors.orange2, bg = colors.bg2, bold = true },
		MiniPickMatchMarked = { fg = colors.orange2, bg = colors.bg2 },
		MiniPickMatchRanges = { fg = colors.blue },
		MiniPickNormal = { fg = colors.fg, bg = colors.bg2 },
		MiniPickPreviewLine = { bg = colors.bg2 },
		MiniPickPreviewRegion = { bg = colors.gray2 },
		MiniPickPrompt = { fg = colors.fg, bg = colors.bg2 },
		MiniPickPromptCaret = { fg = colors.orange2, bg = colors.bg2 },
		MiniPickPromptPrefix = { fg = colors.orange2, bg = colors.bg2 },

		-- Mini.files
		MiniFilesBorder = { fg = colors.gray2, bg = colors.bg2 },
		MiniFilesBorderModified = { fg = colors.orange2, bg = colors.bg2 },
		MiniFilesCursorLine = { bg = colors.bg2 },
		MiniFilesDirectory = { fg = colors.fg },
		MiniFilesFile = { fg = colors.fg },
		MiniFilesNormal = { fg = colors.fg, bg = colors.bg2 },
		MiniFilesTitle = { fg = colors.blue, bg = colors.bg2 },
		MiniFilesTitleFocused = { fg = colors.gray3, bg = colors.bg2, bold = true },

		-- Mini.clue
		MiniClueBorder = { fg = colors.gray2, bg = colors.bg2 },
		MiniClueDescGroup = { fg = colors.orange2 },
		MiniClueDescSingle = { fg = colors.fg, bg = colors.bg2 },
		MiniClueNextKey = { fg = colors.blue },
		MiniClueNextKeyWithPostkeys = { fg = colors.red2 },
		MiniClueSeparator = { fg = colors.yellow },
		MiniClueTitle = { fg = colors.blue, bg = colors.bg2 },

		-- Mini.deps
		MiniDepsChangeAdded = { fg = colors.green },
		MiniDepsChangeRemoved = { fg = colors.red },
		MiniDepsHint = { fg = colors.blue },
		MiniDepsInfo = { fg = colors.yellow },
		MiniDepsMsgBreaking = { fg = colors.orange2 },
		MiniDepsPlaceholder = { fg = colors.gray1 },
		MiniDepsTitle = { fg = colors.blue },
		MiniDepsTitleError = { fg = colors.bg, bg = colors.red },
		MiniDepsTitleSame = { fg = colors.gray2 },
		MiniDepsTitleUpdate = { fg = colors.bg, bg = colors.green },

		-- Mini.notify
		MiniNotifyBorder = { fg = colors.gray2, bg = colors.bg2 },
		MiniNotifyNormal = { fg = colors.fg, bg = colors.bg2 },
		MiniNotifyTitle = { fg = colors.blue, bg = colors.bg2 },

		-- Mini.map
		MiniMapNormal = { fg = colors.fg, bg = colors.bg2 },
		MiniMapSymbolCount = { fg = colors.gray3 },
		MiniMapSymbolLine = { fg = colors.fg },
		MiniMapSymbolView = { fg = colors.gray3 },

		-- Mini.jump / Mini.jump2d
		MiniJump = { fg = colors.gray2, bg = colors.pink },
		MiniJump2dDim = { fg = colors.gray2 },
		MiniJump2dSpot = { fg = colors.orange2, bg = colors.bg, bold = true, underline = true },
		MiniJump2dSpotAhead = { fg = colors.blue2, bg = colors.bg2 },
		MiniJump2dSpotUnique = { fg = colors.blue2, bg = colors.bg, bold = true },

		-- Mini.indentscope
		MiniIndentscopeSymbol = { fg = colors.fg },

		-- Mini.cursorword
		MiniCursorword = { underline = true },
		MiniCursorwordCurrent = { underline = true },

		-- Mini.surround
		MiniSurround = { fg = colors.gray2, bg = colors.pink },

		-- Mini.test
		MiniTestEmphasis = { bold = true },
		MiniTestFail = { fg = colors.red, bold = true },
		MiniTestPass = { fg = colors.green, bold = true },

		-- Mini.trailspace
		MiniTrailspace = { bg = colors.red },

		-- Mini.completion
		MiniCompletionActiveParameter = { underline = true },

		-- Mini.animate
		MiniAnimateCursor = { reverse = true, nocombine = true },
		MiniAnimateNormalFloat = { fg = colors.fg, bg = colors.bg2 },

		-- Mini.operators
		MiniOperatorsExchangeFrom = { fg = colors.fg, bg = colors.gray1 },

		-- Dashboard
		DashboardCenter = { fg = colors.fg },
		DashboardFooter = { fg = colors.yellow },
		DashboardHeader = { fg = colors.green },

		-- Debug
		debugBreakpoint = { fg = colors.red, reverse = true },
		debugPc = { bg = colors.gray3 },

		-- Diffview
		DiffViewNormal = { fg = colors.gray2, bg = colors.bg2 },
		DiffviewFilePanelDeletion = { fg = colors.red2 },
		DiffviewFilePanelInsertion = { fg = colors.green2 },
		DiffviewStatusAdded = { fg = colors.green2 },
		DiffviewStatusDeleted = { fg = colors.red2 },
		DiffviewStatusModified = { fg = colors.blue2 },
		DiffviewStatusRenamed = { fg = colors.blue2 },
		DiffviewVertSplit = { bg = colors.bg },

		-- Gitsigns
		GitSignsAdd = { fg = colors.green },
		GitSignsChange = { fg = colors.blue2 },
		GitSignsDelete = { fg = colors.red },
		GitSignsAddLn = { bg = colors.bg3 },
		GitSignsChangeLn = { bg = colors.bg3 },
		GitSignsDeleteLn = { bg = colors.bg3 },

		-- GitGutter
		GitGutterAdd = { fg = colors.green2 },
		GitGutterChange = { fg = colors.blue2 },
		GitGutterDelete = { fg = colors.red2 },

		-- Indent-blankline
		IndentBlanklineChar = { fg = colors.bg2 },
		IndentBlanklineContextChar = { fg = colors.gray2 },
		IndentBlanklineSpaceChar = { fg = colors.gray3 },
		IndentBlanklineSpaceCharBlankline = { fg = colors.yellow },

		-- LSP UI
		LspCodeLens = { fg = colors.gray1 },
		LspCodeLensSeparator = { link = "LspCodeLens" },
		LspInlayHint = { fg = colors.gray1, bg = colors.bg3 },
		LspReferenceText = { underline = true },
		LspReferenceRead = { underline = true },
		LspReferenceWrite = { underline = true },
		LspReferenceTarget = { link = "LspReferenceText" },
		LspSignatureActiveParameter = { bg = colors.bg3, bold = true },

		-- vim-illuminate
		illuminatedWord = { bg = colors.bg3 },
		IlluminatedWordText = { bg = colors.bg3 },
		IlluminatedWordRead = { bg = colors.bg3 },
		IlluminatedWordWrite = { bg = colors.bg3 },
		illuminatedCurWord = { bg = colors.bg3 },

		-- Diagnostics
		DiagnosticError = { fg = colors.red2, italic = true },
		DiagnosticWarn = { fg = colors.yellow, italic = true },
		DiagnosticInfo = { fg = colors.blue2, italic = true },
		DiagnosticHint = { fg = colors.blue2, italic = true },
		DiagnosticOk = { fg = colors.green, italic = true },

		DiagnosticFloatingError = { fg = colors.red2 },
		DiagnosticFloatingWarn = { fg = colors.yellow },
		DiagnosticFloatingInfo = { fg = colors.blue2 },
		DiagnosticFloatingHint = { fg = colors.blue2 },
		DiagnosticFloatingOk = { fg = colors.green },

		DiagnosticVirtualTextError = { fg = colors.red2, bg = colors.bg3, italic = true },
		DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = colors.bg3, italic = true },
		DiagnosticVirtualTextInfo = { fg = colors.blue2, bg = colors.bg3, italic = true },
		DiagnosticVirtualTextHint = { fg = colors.blue2, bg = colors.bg3, italic = true },
		DiagnosticVirtualTextOk = { fg = colors.green, bg = colors.bg3, italic = true },

		DiagnosticSignError = { fg = colors.red2, bg = colors.bg },
		DiagnosticSignWarn = { fg = colors.yellow, bg = colors.bg },
		DiagnosticSignInfo = { fg = colors.blue2, bg = colors.bg },
		DiagnosticSignHint = { fg = colors.blue2, bg = colors.bg },
		DiagnosticSignOk = { fg = colors.green, bg = colors.bg },

		DiagnosticUnderlineError = { sp = colors.red2, undercurl = true },
		DiagnosticUnderlineWarn = { sp = colors.yellow, undercurl = true },
		DiagnosticUnderlineInfo = { sp = colors.blue2, undercurl = true },
		DiagnosticUnderlineHint = { sp = colors.blue2, undercurl = true },
		DiagnosticUnderlineOk = { sp = colors.green, undercurl = true },

		DiagnosticUnnecessary = { link = "Comment" },
		DiagnosticDeprecated = { sp = colors.red2, strikethrough = true },

		-- NERDTree
		Directory = { fg = colors.fg },
		-- NERDTreeUp = { fg = colors.yellow },
		-- NERDTreeDir = { fg = colors.blue },
		-- NERDTreeOpenable = { fg = colors.gray1 },
		-- NERDTreeClosable = { fg = colors.red },
		-- NERDTreeIgnore = { fg = colors.gray1 },
		-- NERDTreeHelpKey = { fg = colors.fg },
		-- NERDTreeHelpTitle = { fg = colors.pink },
		-- NERDTreeToggleOn = { fg = colors.green },
		-- NERDTreeToggleOff = { fg = colors.orange },
		-- NERDTreeHelpCommand = { fg = colors.yellow },
		-- NERDTreeFile = { fg = colors.fg },
		-- NERDTreeLinkTarget = { fg = colors.blue },
		-- NERDTreeLinkFile = { fg = colors.green },
		-- NERDTreeLinkDir = { fg = colors.pink },
		-- NERDTreeNodeDelimiters = { fg = colors.gray1 },
		-- NERDTreeDirSlash = { fg = colors.gray1 },
		-- NERDTreeExecFile = { fg = colors.green },
		-- NERDTreeRO = { fg = colors.orange },
		-- NERDTreeBookmarkName = { fg = colors.orange },
		-- NERDTreeFlags = { fg = colors.red },
		-- NERDTreeCWD = { fg = colors.red },
		-- NERDTreeBookmarksLeader = { fg = colors.blue },
		-- NERDTreeBookmarksHeader = { fg = colors.red },
		-- NERDTreeBookmark = { fg = colors.orange },
		-- NERDTreePart = { fg = colors.orange },
		-- NERDTreePartFile = { fg = colors.blue },
		-- NERDTreeCurrentNode = { fg = colors.gray1 },

		-- Startify
		StartifyEndOfBuffer = { fg = colors.gray2 },
		StartifyNumber = { fg = colors.red },
		StartifySelect = { fg = colors.gray1 },
		StartifyBracket = { fg = colors.fg },
		StartifySpecial = { fg = colors.yellow },
		StartifyVar = { fg = colors.gray1 },
		StartifyPath = { fg = colors.gray1 },
		StartifyFile = { fg = colors.blue },
		StartifySlash = { fg = colors.gray1 },
		StartifyHeader = { fg = colors.blue },
		StartifyFooter = { fg = colors.pink },
		StartifySection = { fg = colors.pink },

		-- Indent Guides
		IndentGuidesEven = { fg = colors.gray3 },
		IndentGuidesOdd = { fg = colors.gray1 },

		-- Flutter Tools
		FlutterWidgetGuides = { fg = colors.gray2 },

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
		NeogitHunkHeader = { fg = colors.gray3, bg = colors.bg2 },
		NeogitDiffContext = { fg = colors.gray3, bg = colors.bg },
		NeogitDiffAdd = { fg = colors.green2, bg = colors.bg2 },
		NeogitDiffDelete = { fg = colors.red2, bg = colors.bg2 },
		NeogitHunkHeaderHighlight = { fg = colors.gray3, bg = colors.bg2 },
		NeogitDiffContextHighlight = { fg = colors.gray3, bg = colors.bg },
		NeogitDiffAddHighlight = { fg = colors.green2, bg = colors.bg2 },
		NeogitDiffDeleteHighlight = { fg = colors.red2, bg = colors.bg2 },

		-- Nvim-tree
		NvimTreeFolderIcon = { fg = colors.orange },
		NvimTreeEmptyFolderName = { fg = colors.yellow, italic = true },
		NvimTreeCursorLine = { fg = colors.gray2, bg = colors.bg2 },
		NvimTreeExecFile = { fg = colors.green },
		NvimTreeFolderName = { fg = colors.gray3 },
		NvimTreeGitDeleted = { fg = colors.red2 },
		NvimTreeGitDirty = { fg = colors.green2 },
		NvimTreeGitMerge = { fg = colors.blue2 },
		NvimTreeGitNew = { fg = colors.green2 },
		NvimTreeGitRenamed = { fg = colors.blue2 },
		NvimTreeGitStaged = { fg = colors.green2 },
		NvimTreeImageFile = { fg = colors.pink },
		NvimTreeIndentMarker = { fg = colors.gray1 },
		NvimTreeNormal = { fg = colors.gray3, bg = colors.bg2 },
		NvimTreeNormalNC = { bg = colors.bg2 },
		NvimTreeOpenedFolderName = { fg = colors.gray3, italic = true },
		NvimTreeRootFolder = { fg = colors.yellow, bold = true },
		NvimTreeSpecialFile = { fg = colors.orange },
		NvimTreeSymlink = { fg = colors.yellow },
		NvimTreeVertSplit = { fg = colors.bg2 },
		NvimTreeEndOfBuffer = { fg = colors.gray2 },

		-- Telescope
		TelescopeBorder = { fg = colors.fg, bg = config.transparent_background and "NONE" or colors.bg },
		TelescopeMatching = { fg = colors.yellow },
		TelescopePromptPrefix = { fg = colors.green },
		TelescopeSelection = { fg = colors.gray1, bg = colors.bg2 },

		-- Leap.nvim
		LeapLabel = { fg = colors.bg, bg = colors.orange2, bold = true },
		LeapMatch = { fg = colors.yellow, bg = colors.bg3, bold = true },
		LeapBackdrop = { fg = colors.gray1 },

		-- Trouble
		TroubleTextInformation = { fg = colors.blue },
		TroubleFile = { fg = colors.yellow },
		TroubleFoldIcon = { fg = colors.blue },
		TroubleCount = { fg = colors.red },
		TroubleError = { fg = colors.red, bg = colors.gray2 },
		TroubleTextError = { fg = colors.red },
		TroubleNormal = { fg = colors.fg },
		TroubleLocation = { fg = colors.fg },
		TroubleIndent = { fg = colors.gray1 },
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
		CodeActionMenuMenuDisabled = { fg = colors.gray1 },
		CodeActionMenuMenuSelection = { fg = colors.blue },
		CodeActionMenuDetailsTitle = { fg = colors.fg },
		CodeActionMenuDetailsLabel = { fg = colors.yellow },
		CodeActionMenuDetailsPreferred = { fg = colors.green },
		CodeActionMenuDetailsDisabled = { fg = colors.gray1 },
		CodeActionMenuDetailsUndefined = { fg = colors.gray1 },

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
		TSComment = { fg = colors.gray1, italic = config.italic_comments == "italic" },
		TSConditional = { fg = colors.pink, italic = config.italic_keywords == "italic" },
		TSConstBuiltin = { fg = colors.orange2 },
		TSConstMacro = { fg = colors.blue },
		TSConstant = { fg = colors.orange },
		TSConstructor = { fg = colors.fg },
		TSEmphasis = { italic = true },
		TSError = { fg = colors.red2, bg = colors.bg, bold = true },
		TSException = { fg = colors.red },
		TSField = { fg = colors.blue2 },
		TSFloat = { fg = colors.orange },
		TSFuncBuiltin = { fg = colors.orange2, italic = config.italic_functions },
		TSFuncMacro = { fg = colors.pink, italic = config.italic_functions },
		TSFunction = { fg = colors.blue, italic = config.italic_functions },
		TSInclude = { fg = colors.red },
		TSKeyword = { fg = colors.pink, italic = config.italic_keywords == "italic" },
		TSKeywordFunction = { fg = colors.pink, italic = config.italic_functions },
		TSKeywordOperator = { fg = colors.pink },
		TSKeywordReturn = { fg = colors.pink, italic = config.italic_keywords == "italic" },
		TSNone = { fg = colors.orange },
		TSLabel = { fg = colors.pink },
		TSLiteral = { fg = colors.yellow },
		TSMethod = { fg = colors.blue, italic = config.italic_functions },
		TSNamespace = { fg = colors.blue },
		TSNumber = { fg = colors.orange },
		TSOperator = { fg = colors.blue2 },
		TSParameter = { fg = colors.orange },
		TSParameterReference = { fg = colors.orange },
		TSProperty = { fg = colors.blue2 },
		TSPunctBracket = { fg = colors.fg },
		TSPunctDelimiter = { fg = colors.fg },
		TSPunctSpecial = { fg = colors.gray3 },
		TSQueryLinterError = { fg = colors.red2 },
		TSRepeat = { fg = colors.pink, italic = config.italic_keywords == "italic" },
		TSString = { fg = colors.green },
		TSStringEscape = { fg = colors.green },
		TSStringRegex = { fg = colors.yellow },
		TSStrong = { fg = colors.yellow },
		TSStructure = { fg = colors.red },
		TSSymbol = { fg = colors.fg },
		TSTag = { fg = colors.red },
		TSTagDelimiter = { fg = colors.gray3 },
		TSText = { fg = colors.fg },
		TSTitle = { fg = colors.fg, bold = true },
		TSType = { fg = colors.blue },
		TSTypeBuiltin = { fg = colors.blue },
		TSTodo = { fg = colors.orange },
		TSTypeQualifier = { fg = colors.red },
		TSURI = { fg = colors.yellow, underline = true },
		TSUnderline = { underline = true },
		TSVariable = { fg = colors.blue3, italic = config.italic_variables },
		TSVariableBuiltin = { fg = colors.red, italic = config.italic_variables },
		TSDefine = { fg = colors.red },

		-- Modern TreeSitter groups (@-prefixed)
		["@annotation"] = { fg = colors.yellow },
		["@attribute"] = { fg = colors.fg },
		["@boolean"] = { fg = colors.orange, italic = config.italic_booleans == "italic" },
		["@character"] = { fg = colors.yellow },
		["@character.special"] = { fg = colors.yellow },
		["@comment"] = { fg = colors.gray1, italic = config.italic_comments == "italic" },
		["@conditional"] = { fg = colors.pink, italic = config.italic_keywords == "italic" },
		["@constant"] = { fg = colors.orange },
		["@constant.builtin"] = { fg = colors.orange2 },
		["@constant.macro"] = { fg = colors.blue },
		["@constructor"] = { fg = colors.yellow },
		["@emphasis"] = { italic = true },
		["@error"] = { fg = colors.red2, bg = colors.bg, bold = true },
		["@exception"] = { fg = colors.red },
		["@field"] = { fg = colors.blue2 },
		["@float"] = { fg = colors.orange },
		["@function"] = { fg = colors.blue, italic = config.italic_functions },
		["@function.builtin"] = { fg = colors.orange2, italic = config.italic_functions },
		["@function.call"] = { link = "Function" },
		["@function.macro"] = { fg = colors.pink, italic = config.italic_functions },
		["@function.method"] = { link = "Function" },
		["@function.method.call"] = { link = "Function" },
		["@include"] = { fg = colors.pink },
		["@keyword"] = { fg = colors.pink, italic = config.italic_keywords == "italic" },
		["@keyword.function"] = { fg = colors.pink, italic = config.italic_functions },
		["@keyword.operator"] = { fg = colors.pink, italic = config.italic_keywords == "italic" },
		["@keyword.return"] = { fg = colors.pink, italic = config.italic_keywords == "italic" },
		["@keyword.import"] = { link = "Include" },
		["@keyword.export"] = { fg = colors.pink },
		["@keyword.conditional"] = { link = "Conditional" },
		["@keyword.conditional.ternary"] = { link = "Operator" },
		["@keyword.repeat"] = { link = "Repeat" },
		["@keyword.exception"] = { link = "Exception" },
		["@keyword.debug"] = { link = "Exception" },
		["@keyword.storage"] = { link = "Keyword" },
		["@keyword.coroutine"] = { link = "Keyword" },
		["@keyword.type"] = { link = "Keyword" },
		["@keyword.modifier"] = { link = "Keyword" },
		["@keyword.directive"] = { link = "PreProc" },
		["@label"] = { fg = colors.blue2 },
		["@method"] = { fg = colors.blue, italic = config.italic_functions },
		["@method.call"] = { link = "Function" },
		["@module"] = { fg = colors.yellow, italic = true },
		["@namespace"] = { fg = colors.yellow, italic = true },
		["@none"] = { fg = colors.orange },
		["@number"] = { fg = colors.orange },
		["@operator"] = { fg = colors.blue },
		["@parameter"] = { fg = colors.orange },
		["@parameter.reference"] = { fg = colors.orange },
		["@property"] = { fg = colors.yellow },
		["@punctuation.bracket"] = { fg = colors.fg },
		["@punctuation.delimiter"] = { fg = colors.fg },
		["@punctuation.special"] = { fg = colors.gray3 },
		["@repeat"] = { fg = colors.pink, italic = config.italic_keywords == "italic" },
		["@string"] = { fg = colors.green },
		["@string.documentation"] = { fg = colors.blue2 },
		["@string.escape"] = { fg = colors.pink },
		["@string.regex"] = { fg = colors.pink },
		["@string.regexp"] = { fg = colors.pink },
		["@string.special"] = { fg = colors.pink },
		["@string.special.path"] = { link = "Special" },
		["@string.special.symbol"] = { fg = colors.orange },
		["@string.special.url"] = { fg = colors.blue, underline = true, italic = true },
		["@symbol"] = { fg = colors.fg },
		["@tag"] = { fg = colors.blue },
		["@tag.builtin"] = { fg = colors.blue },
		["@tag.attribute"] = { fg = colors.yellow, italic = true },
		["@tag.delimiter"] = { fg = colors.blue2 },
		["@text"] = { fg = colors.fg },
		["@text.strong"] = { fg = colors.red, bold = true },
		["@text.emphasis"] = { fg = colors.red, italic = true },
		["@text.strike"] = { fg = colors.fg, strikethrough = true },
		["@text.title"] = { fg = colors.blue, bold = true },
		["@text.literal"] = { fg = colors.green },
		["@text.reference"] = { fg = colors.pink },
		["@text.uri"] = { fg = colors.blue, underline = true, italic = true },
		["@text.underline"] = { underline = true },
		["@text.todo"] = { fg = colors.bg, bg = colors.orange },
		["@text.todo.checked"] = { fg = colors.green },
		["@text.todo.unchecked"] = { fg = colors.gray1 },
		["@text.note"] = { fg = colors.bg, bg = colors.blue },
		["@text.warning"] = { fg = colors.bg, bg = colors.yellow },
		["@text.danger"] = { fg = colors.bg, bg = colors.red },
		["@text.math"] = { fg = colors.blue },
		["@text.environment"] = { fg = colors.pink },
		["@text.environment.name"] = { fg = colors.blue },
		["@text.diff.add"] = { link = "diffAdded" },
		["@text.diff.delete"] = { link = "diffRemoved" },
		["@type"] = { fg = colors.blue },
		["@type.builtin"] = { fg = colors.blue },
		["@type.qualifier"] = { fg = colors.red },
		["@variable"] = { fg = colors.blue3, italic = config.italic_variables },
		["@variable.member"] = { fg = colors.pink, italic = config.italic_variables },
		["@variable.builtin"] = { fg = colors.red, italic = config.italic_variables },
		["@variable.parameter"] = { fg = colors.orange, italic = config.italic_variables },

		-- @markup (modern markdown/markup groups)
		["@markup"] = { fg = colors.fg },
		["@markup.strong"] = { fg = colors.red, bold = true },
		["@markup.italic"] = { fg = colors.red, italic = true },
		["@markup.strikethrough"] = { fg = colors.fg, strikethrough = true },
		["@markup.underline"] = { underline = true },
		["@markup.heading"] = { fg = colors.blue, bold = true },
		["@markup.heading.1"] = { fg = colors.red, bold = true },
		["@markup.heading.2"] = { fg = colors.orange2, bold = true },
		["@markup.heading.3"] = { fg = colors.yellow, bold = true },
		["@markup.heading.4"] = { fg = colors.green, bold = true },
		["@markup.heading.5"] = { fg = colors.blue, bold = true },
		["@markup.heading.6"] = { fg = colors.pink, bold = true },
		["@markup.heading.markdown"] = { bold = true },
		["@markup.heading.1.markdown"] = { fg = colors.red, bold = true },
		["@markup.heading.2.markdown"] = { fg = colors.orange2, bold = true },
		["@markup.heading.3.markdown"] = { fg = colors.yellow, bold = true },
		["@markup.heading.4.markdown"] = { fg = colors.green, bold = true },
		["@markup.heading.5.markdown"] = { fg = colors.blue, bold = true },
		["@markup.heading.6.markdown"] = { fg = colors.pink, bold = true },
		["@markup.link"] = { fg = colors.pink },
		["@markup.link.label"] = { fg = colors.pink },
		["@markup.link.url"] = { fg = colors.blue, underline = true, italic = true },
		["@markup.raw"] = { fg = colors.green },
		["@markup.math"] = { fg = colors.blue },
		["@markup.environment"] = { fg = colors.pink },
		["@markup.environment.name"] = { fg = colors.blue },
		["@markup.list"] = { fg = colors.blue2 },
		["@markup.list.checked"] = { fg = colors.green },
		["@markup.list.unchecked"] = { fg = colors.gray1 },
		["@markup.quote"] = { fg = colors.pink },

		-- @comment variants
		["@comment.documentation"] = { link = "Comment" },
		["@comment.error"] = { fg = colors.bg, bg = colors.red },
		["@comment.warning"] = { fg = colors.bg, bg = colors.yellow },
		["@comment.note"] = { fg = colors.bg, bg = colors.blue },
		["@comment.hint"] = { fg = colors.bg, bg = colors.blue },
		["@comment.todo"] = { fg = colors.bg, bg = colors.orange },

		-- @diff groups
		["@diff.plus"] = { link = "diffAdded" },
		["@diff.minus"] = { link = "diffRemoved" },
		["@diff.delta"] = { link = "diffChanged" },

		-- @attribute variants
		["@attribute.builtin"] = { link = "Special" },

		-----------------------------------------
		--   Language-Specific Overrides
		-----------------------------------------

		-- Protocol Buffers (CRITICAL for type highlighting fix)
		-- All types should be yellow for consistency (both primitive and custom)
		["@type.proto"] = { fg = colors.yellow },
		["@constructor.proto"] = { fg = colors.yellow },
		["@property.proto"] = { fg = colors.fg },
		["@variable.proto"] = { fg = colors.fg },
		["@lsp.type.type.proto"] = { fg = colors.yellow }, -- LSP override for proto types
		["@lsp.type.class.proto"] = { fg = colors.yellow }, -- Custom message types
		["@lsp.type.enum.proto"] = { fg = colors.yellow }, -- Enum types

		-- CSS/SCSS
		["@keyword.directive.css"] = { link = "Keyword" },
		["@number.css"] = { fg = colors.orange2 },
		["@string.plain.css"] = { fg = colors.fg },
		["@type.tag.css"] = { fg = colors.blue },
		["@type.css"] = { fg = colors.pink },
		["@property.css"] = { fg = colors.blue },
		["@property.scss"] = { fg = colors.blue },
		["@property.class.css"] = { fg = colors.yellow },
		["@property.id.css"] = { fg = colors.yellow },

		-- HTML
		["@character.special.html"] = { fg = colors.red },
		["@markup.link.label.html"] = { fg = colors.fg },
		["@string.special.url.html"] = { fg = colors.green },

		-- Python
		["@constructor.python"] = { fg = colors.blue2 },

		-- Lua
		["@constructor.lua"] = { link = "@punctuation.bracket" },

		-- Bash
		["@variable.parameter.bash"] = { fg = colors.green },
		["@function.builtin.bash"] = { fg = colors.red, italic = true },

		-- Ruby
		["@symbol.ruby"] = { fg = colors.orange },
		["@string.special.symbol.ruby"] = { fg = colors.orange },

		-- Java
		["@constant.java"] = { fg = colors.blue2 },

		-- C/C++
		["@keyword.import.cpp"] = { fg = colors.yellow },
		["@keyword.import.c"] = { fg = colors.yellow },

		-- C#
		["@attribute.c_sharp"] = { fg = colors.yellow },

		-- PHP
		["@method.call.php"] = { link = "Function" },
		["@method.php"] = { link = "Function" },
		["@function.method.call.php"] = { link = "Function" },
		["@function.method.php"] = { link = "Function" },

		-- YAML
		["@label.yaml"] = { fg = colors.yellow },

		-- Git
		gitcommitSummary = { fg = colors.orange, italic = true },
		["@comment.warning.gitcommit"] = { fg = colors.yellow },
		["@string.special.path.gitignore"] = { fg = colors.fg },

		-- Vimdoc
		["@markup.heading.1.delimiter.vimdoc"] = { underdouble = true, fg = colors.bg, bg = colors.bg, sp = colors.fg },
		["@markup.heading.2.delimiter.vimdoc"] = { underline = true, fg = colors.bg, bg = colors.bg, sp = colors.fg },

		-----------------------------------------
		--   Additional Plugin Support
		-----------------------------------------

		-- Health check
		healthSuccess = { fg = colors.blue2 },
		healthWarning = { fg = colors.yellow },
		healthError = { fg = colors.red },

		-- Debug
		debugPC = { bg = colors.bg2 },
		debugBreakpoint = { fg = colors.gray1, bg = colors.bg },

		-- YankHighlight (already defined above, but ensuring it's correct)
		-- YankHighlight = { fg = colors.bg, bg = colors.orange },

		-- TreesitterContext
		TreesitterContextBottom = { sp = colors.bg3, underline = true },
		TreesitterContextLineNumber = { fg = colors.bg3, bg = colors.bg2 },

		-- Rainbow Delimiters
		RainbowDelimiterRed = { fg = colors.red },
		RainbowDelimiterOrange = { fg = colors.orange2 },
		RainbowDelimiterYellow = { fg = colors.yellow },
		RainbowDelimiterGreen = { fg = colors.green },
		RainbowDelimiterCyan = { fg = colors.blue2 },
		RainbowDelimiterBlue = { fg = colors.blue },
		RainbowDelimiterViolet = { fg = colors.pink },

		-- Indent-Blankline (ibl)
		IblIndent = { fg = colors.bg3 },
		IblScope = { fg = colors.fg },

		-----------------------------------------
		--   LSP Semantic Tokens
		-----------------------------------------
		-- These override TreeSitter, so we need to be careful
		-- Matching Catppuccin's color scheme: classes/types in yellow, methods in blue
		["@lsp.type.class"] = { fg = colors.yellow }, -- Classes in yellow (like Catppuccin)
		["@lsp.type.decorator"] = { fg = colors.yellow },
		["@lsp.type.enum"] = { fg = colors.yellow }, -- Enums in yellow
		["@lsp.type.enumMember"] = { fg = colors.orange },
		["@lsp.type.field"] = { fg = colors.fg }, -- Field names should be fg color
		["@lsp.type.function"] = { fg = colors.blue }, -- Functions in blue
		["@lsp.type.interface"] = { fg = colors.yellow }, -- Interfaces in yellow
		["@lsp.type.keyword"] = { fg = colors.pink, italic = true }, -- Keywords in pink
		["@lsp.type.controlKeyword"] = { fg = colors.pink, italic = true }, -- Control keywords (try/catch/if/else) in pink
		["@lsp.type.macro"] = {}, -- Use TreeSitter
		["@lsp.type.method"] = { fg = colors.blue }, -- Methods in blue (like Catppuccin)
		["@lsp.type.namespace"] = { fg = colors.yellow },
		["@lsp.type.parameter"] = {}, -- Use TreeSitter
		["@lsp.type.property"] = { fg = colors.fg }, -- Properties should be fg color too
		["@lsp.type.struct"] = { fg = colors.yellow }, -- Structs in yellow
		["@lsp.type.type"] = { fg = colors.yellow }, -- Type names in yellow (like Catppuccin)
		["@lsp.type.typeParameter"] = { fg = colors.yellow },
		["@lsp.type.variable"] = {}, -- Use TreeSitter (important - don't override!)
		["@lsp.mod.readonly"] = {},
		["@lsp.mod.constant"] = {},
		["@lsp.mod.deprecated"] = { sp = colors.red2, strikethrough = true },
		["@lsp.typemod.function.defaultLibrary"] = { fg = colors.orange2 },
		["@lsp.typemod.function.builtin"] = { fg = colors.orange2 },
		["@lsp.type.regexp"] = { link = "@string.regexp" },
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
