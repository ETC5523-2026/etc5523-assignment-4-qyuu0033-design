# bushfireexplorer

<!-- badges: start -->
<!-- badges: end -->

The **bushfireexplorer** package provides data and interactive tools for exploring Australian bushfire weather risk and climate change findings.

It is based on published research investigating the influence of anthropogenic climate change on extreme bushfire weather in Australia, with a particular focus on the 2019/20 Australian bushfire season.

## Project overview

The Australian Bushfire Weather Risk Explorer is designed for students, researchers and people interested in understanding the relationship between climate change and extreme bushfire weather.

The project presents published research findings in an accessible and interactive format. Users can explore different indicators, climate scenarios and types of evidence through a Shiny application.

## Key features

- A structured dataset containing published bushfire weather risk findings.
- An interactive Shiny dashboard for exploring different indicators and climate scenarios.
- A data summarisation function for filtering research findings.
- Reproducible data preparation scripts.
- Package documentation and a vignette explaining how to use the package.

## Installation

You can install the development version directly from GitHub:

```r
install.packages("remotes")

remotes::install_github(
  "ETC5523-2026/etc5523-assignment-4-qyuu0033-design"
)
```

Load the package:

```r
library(bushfireexplorer)
```

## Launch the Shiny application

Run the interactive Australian Bushfire Weather Risk Explorer:

```r
run_app()
```

The application allows users to select a bushfire weather indicator and climate scenario, explore the available research findings, and view graphical summaries where numerical estimates are available.

## Dataset

The package includes the `bushfire_risk` dataset, which contains nine research findings organised by:

- Indicator
- Climate scenario
- Evidence type
- Estimate type
- Risk ratio
- Comparison
- Research finding
- Limitations
- Source

Load the dataset using:

```r
data("bushfire_risk")
head(bushfire_risk)
```

## Data summarisation

The exported `summarise_risk()` function allows users to filter the research findings by indicator and climate scenario.

For example:

```r
summarise_risk(
  data = bushfire_risk,
  selected_indicator = "Extreme fire weather",
  selected_scenario = "Present climate"
)
```

To view all findings:

```r
summarise_risk(data = bushfire_risk)
```

## Main research findings

The underlying research by van Oldenborgh et al. (2021) reported that:

- The probability of extreme fire weather comparable to the 2019/20 Australian bushfire season was approximately 1.8 times higher in the present climate than in the early twentieth-century climate, based on climate model estimates.
- Observational estimates indicated a probability ratio greater than four, although observational and model estimates should not be directly combined.
- Under a climate approximately 2°C warmer, the probability of comparable extreme fire weather was estimated to increase to approximately eight times the historical level.
- The study found no attributable trend in extreme annual drought or the driest month of the fire season.

These findings concern weather-related fire risk rather than actual fire occurrence or damage.

## Reproducibility

The data preparation script is available in:

```text
data-raw/prepare_risk_data.R
```

It documents the preparation of the package dataset.

The package also includes a vignette:

**Exploring Australian Bushfire Weather Risk**

After installing the package, you can access the vignette using:

```r
browseVignettes("bushfireexplorer")
```

## Important limitations

The findings presented in this package are based on published research and should be interpreted with care.

- Weather-related fire risk is not equivalent to actual bushfire occurrence or impacts.
- Ignition sources, vegetation conditions, exposure and vulnerability also influence bushfire impacts.
- Observational and climate model estimates use different evidence and should not be treated as directly interchangeable.
- Future climate estimates are subject to uncertainty, including the limited number of climate models used in the original study.

## Data source

van Oldenborgh, G. J., et al. (2021). Attribution of the Australian bushfire risk to anthropogenic climate change. *Natural Hazards and Earth System Sciences*, 21, 941–960.

https://doi.org/10.5194/nhess-21-941-2021

## AI-use declaration

Generative AI (ChatGPT) was used as an assisting tool during the development of this project. Specifically, I used AI to:

- Organise the overall assignment framework and plan the structure of the project.
- Identify and solve coding problems, including debugging and improving R code.
- Refine the Shiny application's page layout, visual design and styling.
- Improve the organisation and clarity of project documentation.

All AI-generated suggestions were reviewed, tested and adapted by me. I remain responsible for the final code, design decisions, analysis and interpretation presented in this project.

## Author

Qingqing Yu

Developed as part of ETC5523 Assignment 4: Creating an Interactive Data Product, Monash University.
