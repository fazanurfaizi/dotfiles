return {
  init_options = {
    languageFeatures = {
      completion = {
        defaultTagNameCase = "both",
        defaultAttrNameCase = "kebabCase",
      },
      vue = {
        hybridMode = false,
      },
    },
    settings = {
      typescript = {
        inlayHints = {
          enumMemberValues = {
            enabled = true,
          },
          functionLikeReturnTypes = {
            enabled = true,
          },
          propertyDeclarationTypes = {
            enabled = true,
          },
          parameterTypes = {
            enabled = true,
            suppressWhenArgumentMatchesName = true,
          },
          variableTypes = {
            enabled = true,
          },
        },
      },
    },
    documentFeatures = {
      documentFormatting = {
        defaultPrintWidth = 120,
      },
    },
  },
}
