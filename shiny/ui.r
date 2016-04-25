header <- dashboardHeader(
    title = "Swiftkey Next Word Prediction"
)

sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem("App", tabName = "app", icon = icon("dashboard")),
        menuItem("Codebook", tabName = "codebook", icon = icon("file-code-o"))
    )
)

body <- dashboardBody(
    tabItems(
        tabItem(tabName = "app",
                fluidRow(
                    box(
                        title = "Type in the Box", width = 12, solidHeader = TRUE, status = "warning",
                        textInput('fitb',label='',value='Hey! I just met you'),
                        uiOutput('suggestions')
                    ),
                    box(
                        title = "Modified Kneser-Ney Probability", width = 6, solidHeader = TRUE, status = "primary",
                        plotOutput('histo')
                    ),
                    box(
                        title = "Word Cloud", width = 6, solidHeader = TRUE, status = "primary",
                        plotOutput('cloud')
                    )
                )
        ),
        tabItem(tabName = "codebook",
                includeMarkdown('mile.Rmd')
        )
    )
)


dashboardPage(
    header,
    sidebar,
    body
)