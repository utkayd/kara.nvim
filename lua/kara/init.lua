local M = {}

-- Color palette
M.colors = {
	-- Base colors
	fg = "#DFE0EA",
	bg = "#191B20",

	-- Background variants
	bg1 = "#1E2026", -- line_bg, gutter_bg
	bg2 = "#16181D", -- dark, black
	bg3 = "#272932", -- visual_select_bg, black1
	bg4 = "#21252D", -- old gray

	-- Foreground/Gray variants
	gray1 = "#4D5264", -- comment, vsplit_bg
	gray2 = "#495163", -- selection_fg
	gray3 = "#515669", -- gray_punc
	gray4 = "#555B6C", -- line_fg
	gray5 = "#5E697E", -- selection_bg
	gray6 = "#606978", -- non_text
	gray7 = "#6E7380", -- old gray2
	gray8 = "#AEAFAD", -- cursor_bg
	gray9 = "#BBBBBB", -- accent
	gray10 = "#CFD0D7", -- white1

	-- Primary colors
	red = "#E85A84",
	red2 = "#D95555",
	green = "#A6DB95",
	green2 = "#A6DB95",
	blue = "#7EB7E6",
	blue2 = "#568BB4",
	blue3 = "#6CAEC0",
	yellow = "#EED49F",
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
		Comment = { fg = colors.gray1, italic = config.italic_comments == "italic" },
		Conceal = { fg = colors.fg },
		Conditional = { fg = colors.red },
		Constant = { fg = colors.pink },
		Cursor = { fg = colors.yellow, bg = colors.bg },
		CursorColumn = { fg = "NONE", bg = "NONE" },
		CursorLine = { bg = colors.bg3 },
		CursorLineNr = { fg = colors.fg, bg = colors.bg1, bold = true },

		Debug = { fg = colors.fg },
		Define = { fg = colors.blue },
		Delimiter = { fg = colors.gray3 },
		DiffAdd = { fg = colors.green },
		DiffAdded = { fg = colors.green },
		DiffChange = { fg = colors.green },
		DiffDelete = { fg = colors.red },
		DiffRemoved = { fg = colors.red },
		DiffText = { fg = colors.gray10 },
		DiffFile = { fg = colors.pink },

		Error = { fg = colors.red, bg = colors.bg, bold = true },
		ErrorMsg = { fg = colors.bg4, bg = "NONE", bold = true },
		Exception = { fg = colors.fg },

		Float = { fg = colors.orange },
		FloatBorder = { fg = colors.gray7, bg = "NONE" },
		FoldColumn = { fg = colors.gray4 },
		Folded = { fg = colors.fg, bg = colors.bg4 },
		Function = { fg = colors.green },

		Identifier = { fg = colors.gray10 },
		Ignore = { fg = colors.gray3 },
		IncSearch = { fg = colors.fg, bg = colors.gray1 },
		Include = { fg = colors.blue, italic = config.italic_keywords == "italic" },

		Keyword = { fg = colors.red, italic = config.italic_keywords == "italic" },

		Label = { fg = colors.red },
		LineNr = { fg = colors.gray4, bg = colors.bg1 },

		Macro = { fg = colors.red, italic = config.italic_keywords == "italic" },
		MatchParen = { fg = colors.gray10, bg = colors.bg2 },
		MatchParenCur = { underline = true },
		MatchWord = { underline = true },
		MatchWordCur = { underline = true },
		ModeMsg = { fg = colors.fg, bg = colors.bg },
		MoreMsg = { fg = colors.orange2 },
		MsgArea = { fg = colors.fg, bg = config.transparent_background and "NONE" or colors.bg },
		MsgSeparator = { fg = colors.fg, bg = colors.bg },

		NonText = { fg = colors.gray7 },
		Normal = { fg = colors.fg, bg = config.transparent_background and "NONE" or colors.bg },
		NormalFloat = { bg = colors.bg2 },
		NormalNC = { fg = colors.fg, bg = config.transparent_background and "NONE" or colors.bg },
		Number = { fg = colors.orange },

		Operator = { fg = colors.fg },
		Pmenu = { fg = colors.gray10, bg = colors.bg2 },
		PmenuSbar = { bg = colors.bg4 },
		PmenuSel = { fg = colors.gray4, bg = colors.bg2 },
		PmenuThumb = { bg = colors.bg2 },
		PreCondit = { fg = colors.blue },
		PreProc = { fg = colors.blue },

		Question = { fg = colors.green },
		QuickFixLine = { fg = colors.orange2 },

		Repeat = { fg = colors.red },

		Search = { fg = colors.fg, bg = colors.gray1 },
		CurSearch = { fg = colors.bg, bg = colors.yellow },
		SignColumn = { bg = colors.bg1 },
		Special = { fg = colors.gray3 },
		SpecialChar = { fg = colors.yellow },
		SpecialComment = { fg = colors.pink },
		SpecialKey = { fg = colors.gray3, bold = true },
		SpellBad = { fg = colors.red, underline = true },
		SpellCap = { fg = colors.orange, underline = true },
		SpellLocal = { fg = colors.green, underline = true },
		SpellRare = { fg = colors.pink, underline = true },
		Statement = { fg = colors.red },
		StatusLine = { fg = colors.gray4, bg = colors.bg2 },
		StatusLineNC = { fg = colors.gray4, bg = colors.bg2 },
		StatusLineSeparator = { fg = colors.bg2 },
		StatusLineTerm = { fg = colors.green, bg = colors.bg2 },
		StatusLineTermNC = { fg = colors.gray3, bg = colors.bg2 },
		StorageClass = { fg = colors.red },
		String = { fg = colors.yellow },
		Structure = { fg = colors.green },
		Substitute = { fg = colors.gray7, bg = colors.orange },

		TabLine = { fg = colors.gray4 },
		TabLineFill = { fg = colors.gray4 },
		TabLineSel = { fg = colors.fg },
		Tag = { fg = colors.gray3 },
		TermCursor = { fg = colors.fg, bg = colors.gray8 },
		TermCursorNC = { fg = colors.fg, bg = colors.gray8 },
		Title = { fg = colors.gray3 },
		Todo = { fg = colors.yellow, bold = true },
		Type = { fg = colors.blue, italic = config.italic_keywords == "italic" },
		Typedef = { fg = colors.blue, italic = config.italic_keywords == "italic" },

		Variable = { fg = colors.fg },
		VertSplit = { fg = colors.gray2 },
		WinSeparator = { fg = colors.gray1 },
		Visual = { fg = "NONE", bg = colors.bg3, bold = true },
		VisualNOS = { fg = colors.gray2, bg = colors.gray5 },

		WarningMsg = { fg = colors.orange2, bg = "NONE" },
		Whitespace = { fg = colors.gray6 },
		WildMenu = { fg = colors.fg },
		lCursor = { fg = colors.fg, bg = colors.gray8 },

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
		markdownRule = { fg = colors.gray9 },
		markdownListMarker = { fg = colors.red },
		markdownHeadingDelimiter = { fg = colors.fg },
		markdownHeadingRule = { fg = colors.gray9 },
		markdownUrlTitleDelimiter = { fg = colors.fg },
		markdownCodeSpecial = { fg = colors.orange },
		markdownCodeDelimiter = { fg = colors.green },
		markdownBlockquote = { fg = colors.gray9 },
		markdownIdDeclaration = { fg = colors.fg },
		markdownIdDelimiter = { fg = colors.gray7 },
		markdownLinkDelimiter = { fg = colors.gray7 },
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
		BufferInactive = { fg = colors.gray7, bg = colors.bg2 },
		BufferInactiveIndex = { fg = colors.gray7, bg = colors.bg2 },
		BufferInactiveMod = { fg = colors.yellow, bg = colors.bg2 },
		BufferInactiveSign = { fg = colors.gray7, bg = colors.bg2 },
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
		CmpDocumentationBorder = { fg = colors.gray7 },
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
		BlinkCmpMenuSelection = { bg = colors.bg3, bold = true },
		BlinkCmpScrollBarThumb = { bg = colors.gray2 },
		BlinkCmpScrollBarGutter = { bg = colors.gray7 },

		BlinkCmpLabel = { fg = colors.gray9 },
		BlinkCmpLabelDeprecated = { fg = colors.gray2, strikethrough = true },
		BlinkCmpLabelMatch = { fg = colors.blue, bold = true },
		BlinkCmpLabelDetail = { fg = colors.gray9 },
		BlinkCmpLabelDescription = { fg = colors.gray9 },

		BlinkCmpGhostText = { fg = colors.gray8 },

		BlinkCmpDoc = { fg = colors.fg, bg = colors.bg2 },
		BlinkCmpDocBorder = { fg = colors.gray9, bg = colors.bg2 },
		BlinkCmpDocSeparator = { fg = colors.gray9, bg = colors.bg2 },
		BlinkCmpDocCursorLine = { bg = colors.bg3 },

		BlinkCmpSignatureHelp = { fg = colors.fg, bg = colors.bg2 },
		BlinkCmpSignatureHelpBorder = { fg = colors.gray9, bg = colors.bg2 },
		BlinkCmpSignatureHelpActiveParameter = { fg = colors.yellow, bold = true },

		BlinkCmpSource = { fg = colors.pink },

		-- Blink.cmp Kind highlights
		BlinkCmpKind = { fg = colors.blue },
		BlinkCmpKindClass = { fg = colors.yellow },
		BlinkCmpKindColor = { fg = colors.red },
		BlinkCmpKindConstant = { fg = colors.orange },
		BlinkCmpKindConstructor = { fg = colors.blue },
		BlinkCmpKindEnum = { fg = colors.yellow },
		BlinkCmpKindEnumMember = { fg = colors.blue3 },
		BlinkCmpKindEvent = { fg = colors.blue },
		BlinkCmpKindField = { fg = colors.green },
		BlinkCmpKindFile = { fg = colors.blue },
		BlinkCmpKindFolder = { fg = colors.blue },
		BlinkCmpKindFunction = { fg = colors.blue },
		BlinkCmpKindInterface = { fg = colors.yellow },
		BlinkCmpKindKeyword = { fg = colors.pink },
		BlinkCmpKindMethod = { fg = colors.blue },
		BlinkCmpKindModule = { fg = colors.blue },
		BlinkCmpKindOperator = { fg = colors.blue3 },
		BlinkCmpKindProperty = { fg = colors.blue },
		BlinkCmpKindReference = { fg = colors.red },
		BlinkCmpKindSnippet = { fg = colors.red },
		BlinkCmpKindStruct = { fg = colors.blue },
		BlinkCmpKindText = { fg = colors.green },
		BlinkCmpKindTypeParameter = { fg = colors.red },
		BlinkCmpKindUnit = { fg = colors.green },
		BlinkCmpKindValue = { fg = colors.orange },
		BlinkCmpKindVariable = { fg = colors.red },
		BlinkCmpKindCopilot = { fg = colors.blue3 },

		-- Snacks.nvim - Dashboard
		SnacksDashboardNormal = { fg = colors.gray1 },
		SnacksDashboardDesc = { fg = colors.gray1 },
		SnacksDashboardDir = { fg = colors.gray2 },
		SnacksDashboardFile = { fg = colors.fg },
		SnacksDashboardTerminal = { fg = colors.fg },
		SnacksDashboardHeader = { fg = colors.gray1, bold = true },
		SnacksDashboardTitle = { fg = colors.gray1, bold = true },
		SnacksDashboardIcon = { fg = colors.gray1 },
		SnacksDashboardKey = { fg = colors.fg },
		SnacksDashboardFooter = { fg = colors.gray1, italic = true },
		SnacksDashboardSpecial = { fg = colors.yellow },

		-- Snacks.nvim - Picker
		SnacksPicker = { fg = colors.fg, bg = colors.bg2 },
		SnacksPickerBorder = { fg = colors.gray1, bg = colors.bg2 },
		SnacksPickerTitle = { fg = colors.gray1, bg = "NONE" },
		SnacksPickerCursorLine = { bg = colors.bg3 },
		SnacksPickerListCursorLine = { bg = colors.bg3, bold = true },
		SnacksPickerPreviewCursorLine = { bg = colors.bg3, bold = true },
		SnacksPickerSearch = { fg = colors.gray6, bg = colors.orange },
		SnacksPickerPickWin = { fg = colors.gray6, bg = colors.orange },
		SnacksPickerPickWinCurrent = { fg = colors.bg, bg = colors.orange },
		SnacksPickerMatch = { fg = colors.gray4 },
		SnacksPickerPrompt = { fg = colors.gray4 },
		SnacksPickerSpinner = { fg = colors.gray4 },
		SnacksPickerSpecial = { fg = colors.gray4 },

		SnacksPickerDir = { fg = colors.gray8 },
		SnacksPickerDirectory = { fg = colors.fg },
		SnacksPickerDimmed = { fg = colors.fg },
		SnacksPickerBold = { bold = true },
		SnacksPickerItalic = { italic = true },
		SnacksPickerDelim = { fg = colors.gray4 },

		SnacksPickerTree = { fg = colors.gray6 },
		SnacksPickerCol = { fg = colors.gray6 },
		SnacksPickerRow = { fg = colors.yellow },
		SnacksPickerIdx = { fg = colors.orange },
		SnacksPickerSelected = { fg = colors.orange },
		SnacksPickerUnselected = { fg = colors.gray8 },
		SnacksPickerTotals = { fg = colors.gray8 },
		SnacksPickerToggle = { fg = colors.yellow },

		SnacksPickerIcon = { fg = colors.gray4, bg = "NONE" },
		SnacksPickerIconFile = { fg = colors.fg },
		SnacksPickerIconEvent = { fg = colors.gray4 },
		SnacksPickerIconArray = { fg = colors.fg },
		SnacksPickerIconCategory = { fg = colors.blue },
		SnacksPickerIconConstructor = { fg = colors.fg },
		SnacksPickerIconEnumMember = { fg = colors.blue3 },
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

		SnacksPickerPathHidden = { fg = colors.gray8 },
		SnacksPickerPathIgnored = { fg = colors.gray8 },
		SnacksPickerBufFlags = { fg = colors.gray8 },
		SnacksPickerBufNr = { fg = colors.orange },
		SnacksPickerBufType = { fg = colors.green },
		SnacksPickerFileType = { fg = colors.blue },

		SnacksPickerCmd = { fg = colors.green },
		SnacksPickerCmdBuiltin = { fg = colors.fg },

		SnacksPickerKeymapMode = { fg = colors.orange },
		SnacksPickerKeymapLhs = { fg = colors.gray4 },
		SnacksPickerKeymapRhs = { fg = colors.gray8 },
		SnacksPickerKeymapNowait = { fg = colors.pink },
		SnacksPickerRegister = { fg = colors.orange },

		SnacksPickerAuEvent = { fg = colors.pink },
		SnacksPickerAuGroup = { fg = colors.blue },
		SnacksPickerAuPattern = { fg = colors.yellow },

		SnacksPickerTime = { fg = colors.gray4 },

		SnacksPickerManPage = { fg = colors.gray4 },
		SnacksPickerManSection = { fg = colors.orange },

		SnacksPickerDiagnosticCode = { fg = colors.gray4 },
		SnacksPickerDiagnosticSource = { fg = colors.gray2 },

		SnacksPickerLspEnabled = { fg = colors.gray4 },
		SnacksPickerLspAttached = { fg = colors.orange2 },
		SnacksPickerLspAttachedBuf = { fg = colors.yellow },
		SnacksPickerLspDisabled = { fg = colors.orange2 },
		SnacksPickerLspUnavailable = { fg = colors.red2 },

		SnacksPickerGitStatus = { fg = colors.gray4 },
		SnacksPickerGitStatusAdded = { fg = colors.green2 },
		SnacksPickerGitStatusDeleted = { fg = colors.red },
		SnacksPickerGitStatusIgnored = { fg = colors.gray8 },
		SnacksPickerGitStatusModified = { fg = colors.orange2 },
		SnacksPickerGitStatusStaged = { fg = colors.blue },
		SnacksPickerGitStatusUnmerged = { fg = colors.red2 },
		SnacksPickerGitStatusUntracked = { fg = colors.gray8 },
		SnacksPickerGitType = { fg = colors.gray3 },
		SnacksPickerGitBranch = { fg = colors.gray3 },
		SnacksPickerGitBranchCurrent = { fg = colors.orange },
		SnacksPickerGitCommit = { fg = colors.pink },
		SnacksPickerGitAuthor = { fg = colors.pink },
		SnacksPickerGitDate = { fg = colors.gray4 },
		SnacksPickerGitDetached = { fg = colors.orange2 },
		SnacksPickerGitIssue = { fg = colors.orange },
		SnacksPickerGitScope = { italic = true },
		SnacksPickerGitBreaking = { fg = colors.red, bold = true },

		SnacksPickerUndoAdded = { fg = colors.green2 },
		SnacksPickerUndoRemoved = { fg = colors.red },
		SnacksPickerUndoCurrent = { fg = colors.pink },
		SnacksPickerUndoSaved = { fg = colors.gray4 },

		-- Snacks.nvim - Input
		SnacksInputNormal = { fg = colors.fg, bg = colors.bg },
		SnacksInputBorder = { fg = colors.yellow, bg = colors.bg },
		SnacksInputTitle = { fg = colors.yellow, bg = colors.bg },
		SnacksInputIcon = { fg = colors.blue },

		-- Snacks.nvim - Indent
		SnacksIndent = { fg = colors.gray8 },
		SnacksIndentScope = { fg = colors.gray4 },
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
		SnacksWinKeySep = { fg = colors.gray8 },
		SnacksWinSeparator = { fg = colors.gray2 },

		-- Snacks.nvim - Image
		SnacksImageAnchor = { fg = colors.gray4 },
		SnacksImageLoading = { fg = colors.gray8 },
		SnacksImageMath = { fg = colors.pink },
		SnacksImageSpinner = { fg = colors.gray4 },

		-- Snacks.nvim - Normal & Backdrop
		SnacksNormal = { fg = colors.fg, bg = colors.bg2 },
		SnacksNormalNC = { fg = colors.fg, bg = colors.bg2 },
		SnacksTitle = { fg = colors.blue, bg = colors.bg2 },
		SnacksBackdrop = { bg = "#000000" },

		-- Dashboard
		DashboardCenter = { fg = colors.fg },
		DashboardFooter = { fg = colors.yellow },
		DashboardHeader = { fg = colors.green },

		-- Debug
		debugBreakpoint = { fg = colors.red, reverse = true },
		debugPc = { bg = colors.gray10 },

		-- Diffview
		DiffViewNormal = { fg = colors.gray7, bg = colors.bg2 },
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
		IndentBlanklineContextChar = { fg = colors.gray7 },
		IndentBlanklineSpaceChar = { fg = colors.gray10 },
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
		DiagnosticVirtualTextHint = { fg = colors.gray7 },

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
		StartifyEndOfBuffer = { fg = colors.gray6 },
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
		IndentGuidesEven = { fg = colors.gray10 },
		IndentGuidesOdd = { fg = colors.gray1 },

		-- Flutter Tools
		FlutterWidgetGuides = { fg = colors.gray7 },

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
		NeogitHunkHeader = { fg = colors.gray9, bg = colors.bg2 },
		NeogitDiffContext = { fg = colors.gray9, bg = colors.bg },
		NeogitDiffAdd = { fg = colors.green2, bg = colors.bg2 },
		NeogitDiffDelete = { fg = colors.red2, bg = colors.bg2 },
		NeogitHunkHeaderHighlight = { fg = colors.gray9, bg = colors.bg2 },
		NeogitDiffContextHighlight = { fg = colors.gray9, bg = colors.bg },
		NeogitDiffAddHighlight = { fg = colors.green2, bg = colors.bg2 },
		NeogitDiffDeleteHighlight = { fg = colors.red2, bg = colors.bg2 },

		-- Nvim-tree
		NvimTreeFolderIcon = { fg = colors.orange },
		NvimTreeEmptyFolderName = { fg = colors.yellow, italic = true },
		NvimTreeCursorLine = { fg = colors.gray4, bg = colors.bg3 },
		NvimTreeExecFile = { fg = colors.green },
		NvimTreeFolderName = { fg = colors.gray10 },
		NvimTreeGitDeleted = { fg = colors.red2 },
		NvimTreeGitDirty = { fg = colors.green2 },
		NvimTreeGitMerge = { fg = colors.blue3 },
		NvimTreeGitNew = { fg = colors.green2 },
		NvimTreeGitRenamed = { fg = colors.blue3 },
		NvimTreeGitStaged = { fg = colors.green2 },
		NvimTreeImageFile = { fg = colors.pink },
		NvimTreeIndentMarker = { fg = colors.gray1 },
		NvimTreeNormal = { fg = colors.gray10, bg = colors.bg2 },
		NvimTreeNormalNC = { bg = colors.bg2 },
		NvimTreeOpenedFolderName = { fg = colors.gray10, italic = true },
		NvimTreeRootFolder = { fg = colors.yellow, bold = true },
		NvimTreeSpecialFile = { fg = colors.orange },
		NvimTreeSymlink = { fg = colors.yellow },
		NvimTreeVertSplit = { fg = colors.bg2 },
		NvimTreeEndOfBuffer = { fg = colors.gray6 },

		-- Telescope
		TelescopeBorder = { fg = colors.fg, bg = config.transparent_background and "NONE" or colors.bg },
		TelescopeMatching = { fg = colors.yellow },
		TelescopePromptPrefix = { fg = colors.green },
		TelescopeSelection = { fg = colors.gray1, bg = colors.bg3 },

		-- Trouble
		TroubleTextInformation = { fg = colors.blue },
		TroubleFile = { fg = colors.yellow },
		TroubleFoldIcon = { fg = colors.blue },
		TroubleCount = { fg = colors.red },
		TroubleError = { fg = colors.red, bg = colors.gray4 },
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
		TSPunctSpecial = { fg = colors.gray3 },
		TSQueryLinterError = { fg = colors.red2 },
		TSRepeat = { fg = colors.red, italic = config.italic_keywords == "italic" },
		TSString = { fg = colors.yellow },
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
		TSVariable = { fg = colors.fg, italic = config.italic_variables },
		TSVariableBuiltin = { fg = colors.pink, italic = config.italic_variables },
		TSDefine = { fg = colors.red },

		-- Modern TreeSitter groups (@-prefixed)
		["@annotation"] = { fg = colors.yellow },
		["@attribute"] = { fg = colors.fg },
		["@boolean"] = { fg = colors.orange, italic = config.italic_booleans == "italic" },
		["@character"] = { fg = colors.yellow },
		["@character.special"] = { fg = colors.yellow },
		["@comment"] = { fg = colors.gray1, italic = config.italic_comments == "italic" },
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
		["@punctuation.special"] = { fg = colors.gray3 },
		["@repeat"] = { fg = colors.red, italic = config.italic_keywords == "italic" },
		["@string"] = { fg = colors.green },
		["@string.escape"] = { fg = colors.green },
		["@string.regex"] = { fg = colors.yellow },
		["@string.special"] = { fg = colors.yellow },
		["@symbol"] = { fg = colors.fg },
		["@tag"] = { fg = colors.red },
		["@tag.delimiter"] = { fg = colors.gray3 },
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
