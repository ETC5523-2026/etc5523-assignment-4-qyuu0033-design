# Exploring Australian Bushfire Weather Risk

## Introduction

The Australian Bushfire Weather Risk Explorer is an interactive data
product based on published research examining the influence of
anthropogenic climate change on extreme bushfire weather risk in
Australia.

It focuses on findings related to the 2019/20 Australian bushfire
season.

## Dataset

The package includes the `bushfire_risk` dataset, which contains nine
curated research findings covering:

- Extreme fire weather
- Extreme temperature
- Extreme drought
- The driest month of the fire season
- Natural climate variability

## Loading the dataset

Load the package and inspect the dataset:

``` r
library(bushfireexplorer)

head(bushfire_risk)
```

    ##              indicator          scenario        evidence_type
    ## 1 Extreme fire weather   Present climate        Climate model
    ## 2 Extreme fire weather   Present climate        Climate model
    ## 3 Extreme fire weather   Present climate     ERA5 observation
    ## 4 Extreme fire weather 2C warmer climate        Climate model
    ## 5 Extreme fire weather 2C warmer climate        Climate model
    ## 6  Extreme temperature Long-term warming Attribution analysis
    ##              estimate_type ratio_value ratio_operator
    ## 1         Central estimate         1.8              ~
    ## 2 Conservative lower bound         1.3              ~
    ## 3        Observed estimate         4.0              >
    ## 4         Central estimate         8.0              ~
    ## 5 Conservative lower bound         4.0              ~
    ## 6         Minimum increase         2.0             >=
    ##                               comparison
    ## 1 Relative to early 20th century climate
    ## 2 Relative to early 20th century climate
    ## 3 Relative to early 20th century climate
    ## 4 Relative to early 20th century climate
    ## 5 Relative to early 20th century climate
    ## 6           Long-term warming comparison
    ##                                                                     finding
    ## 1          Extreme fire-weather probability increased by approximately 80%.
    ## 2  The conservative lower bound indicates an increase of approximately 30%.
    ## 3            ERA5 analysis indicated a probability ratio greater than four.
    ## 4 Probability of a 2019/20-level event is approximately eight times higher.
    ## 5          The conservative lower bound is approximately four times higher.
    ## 6                             Extreme heat became at least twice as likely.
    ##                                                            limitation
    ## 1  Model estimate; observational and model estimates did not overlap.
    ## 2                    Conservative lower bound, not an exact estimate.
    ## 3 ERA5 estimate should not be directly combined with model estimates.
    ## 4               Future estimate was based on only two climate models.
    ## 5                  Future estimate has substantial model uncertainty.
    ## 6        Do not interpret as a measure of actual bushfire occurrence.
    ##                         source
    ## 1 van Oldenborgh et al. (2021)
    ## 2 van Oldenborgh et al. (2021)
    ## 3 van Oldenborgh et al. (2021)
    ## 4 van Oldenborgh et al. (2021)
    ## 5 van Oldenborgh et al. (2021)
    ## 6 van Oldenborgh et al. (2021)

You can also inspect its structure:

``` r
str(bushfire_risk)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    9 obs. of  10 variables:
    ##  $ indicator     : chr  "Extreme fire weather" "Extreme fire weather" "Extreme fire weather" "Extreme fire weather" ...
    ##  $ scenario      : chr  "Present climate" "Present climate" "Present climate" "2C warmer climate" ...
    ##  $ evidence_type : chr  "Climate model" "Climate model" "ERA5 observation" "Climate model" ...
    ##  $ estimate_type : chr  "Central estimate" "Conservative lower bound" "Observed estimate" "Central estimate" ...
    ##  $ ratio_value   : num  1.8 1.3 4 8 4 2 NA NA NA
    ##  $ ratio_operator: chr  "~" "~" ">" "~" ...
    ##  $ comparison    : chr  "Relative to early 20th century climate" "Relative to early 20th century climate" "Relative to early 20th century climate" "Relative to early 20th century climate" ...
    ##  $ finding       : chr  "Extreme fire-weather probability increased by approximately 80%." "The conservative lower bound indicates an increase of approximately 30%." "ERA5 analysis indicated a probability ratio greater than four." "Probability of a 2019/20-level event is approximately eight times higher." ...
    ##  $ limitation    : chr  "Model estimate; observational and model estimates did not overlap." "Conservative lower bound, not an exact estimate." "ERA5 estimate should not be directly combined with model estimates." "Future estimate was based on only two climate models." ...
    ##  $ source        : chr  "van Oldenborgh et al. (2021)" "van Oldenborgh et al. (2021)" "van Oldenborgh et al. (2021)" "van Oldenborgh et al. (2021)" ...

## Summarising research findings

The
[`summarise_risk()`](https://etc5523-2026.github.io/etc5523-assignment-4-qyuu0033-design/reference/summarise_risk.md)
function allows users to explore research findings by indicator and
climate scenario.

### View all research findings

``` r
summarise_risk(data = bushfire_risk)
```

    ##                     indicator                scenario
    ## 1        Extreme fire weather         Present climate
    ## 2        Extreme fire weather         Present climate
    ## 3        Extreme fire weather         Present climate
    ## 4        Extreme fire weather       2C warmer climate
    ## 5        Extreme fire weather       2C warmer climate
    ## 6         Extreme temperature       Long-term warming
    ## 7             Extreme drought             Fire season
    ## 8                Driest month      September-February
    ## 9 Natural climate variability 2019 drought conditions
    ##                  evidence_type            estimate_type ratio_value
    ## 1                Climate model         Central estimate         1.8
    ## 2                Climate model Conservative lower bound         1.3
    ## 3             ERA5 observation        Observed estimate         4.0
    ## 4                Climate model         Central estimate         8.0
    ## 5                Climate model Conservative lower bound         4.0
    ## 6         Attribution analysis         Minimum increase         2.0
    ## 7         Attribution analysis      Qualitative finding          NA
    ## 8         Attribution analysis      Qualitative finding          NA
    ## 9 Climate variability analysis      Qualitative finding          NA
    ##   ratio_operator                             comparison
    ## 1              ~ Relative to early 20th century climate
    ## 2              ~ Relative to early 20th century climate
    ## 3              > Relative to early 20th century climate
    ## 4              ~ Relative to early 20th century climate
    ## 5              ~ Relative to early 20th century climate
    ## 6             >=           Long-term warming comparison
    ## 7           <NA>       No attributable trend identified
    ## 8           <NA>       No attributable trend identified
    ## 9           <NA>          July-December drought anomaly
    ##                                                                     finding
    ## 1          Extreme fire-weather probability increased by approximately 80%.
    ## 2  The conservative lower bound indicates an increase of approximately 30%.
    ## 3            ERA5 analysis indicated a probability ratio greater than four.
    ## 4 Probability of a 2019/20-level event is approximately eight times higher.
    ## 5          The conservative lower bound is approximately four times higher.
    ## 6                             Extreme heat became at least twice as likely.
    ## 7           No attributable trend was identified in extreme annual drought.
    ## 8     No attributable trend was identified in the driest fire-season month.
    ## 9          IOD and SAM contributed substantially to the drought conditions.
    ##                                                            limitation
    ## 1  Model estimate; observational and model estimates did not overlap.
    ## 2                    Conservative lower bound, not an exact estimate.
    ## 3 ERA5 estimate should not be directly combined with model estimates.
    ## 4               Future estimate was based on only two climate models.
    ## 5                  Future estimate has substantial model uncertainty.
    ## 6        Do not interpret as a measure of actual bushfire occurrence.
    ## 7    Climate change attribution was not identified for this variable.
    ## 8    Climate change attribution was not identified for this variable.
    ## 9             Natural variability is only one component of the event.
    ##                         source
    ## 1 van Oldenborgh et al. (2021)
    ## 2 van Oldenborgh et al. (2021)
    ## 3 van Oldenborgh et al. (2021)
    ## 4 van Oldenborgh et al. (2021)
    ## 5 van Oldenborgh et al. (2021)
    ## 6 van Oldenborgh et al. (2021)
    ## 7 van Oldenborgh et al. (2021)
    ## 8 van Oldenborgh et al. (2021)
    ## 9 van Oldenborgh et al. (2021)

### Filter by risk indicator and climate scenario

For example, users can focus on extreme fire weather under the present
climate:

``` r
summarise_risk(
  data = bushfire_risk,
  selected_indicator = "Extreme fire weather",
  selected_scenario = "Present climate"
)
```

    ##              indicator        scenario    evidence_type
    ## 1 Extreme fire weather Present climate    Climate model
    ## 2 Extreme fire weather Present climate    Climate model
    ## 3 Extreme fire weather Present climate ERA5 observation
    ##              estimate_type ratio_value ratio_operator
    ## 1         Central estimate         1.8              ~
    ## 2 Conservative lower bound         1.3              ~
    ## 3        Observed estimate         4.0              >
    ##                               comparison
    ## 1 Relative to early 20th century climate
    ## 2 Relative to early 20th century climate
    ## 3 Relative to early 20th century climate
    ##                                                                    finding
    ## 1         Extreme fire-weather probability increased by approximately 80%.
    ## 2 The conservative lower bound indicates an increase of approximately 30%.
    ## 3           ERA5 analysis indicated a probability ratio greater than four.
    ##                                                            limitation
    ## 1  Model estimate; observational and model estimates did not overlap.
    ## 2                    Conservative lower bound, not an exact estimate.
    ## 3 ERA5 estimate should not be directly combined with model estimates.
    ##                         source
    ## 1 van Oldenborgh et al. (2021)
    ## 2 van Oldenborgh et al. (2021)
    ## 3 van Oldenborgh et al. (2021)

The function returns matching research records, including the evidence
type, estimate type, numerical estimate, research finding and
limitations.

Qualitative findings are also retained when numerical estimates are
unavailable.

## Launching the Shiny application

Launch the interactive application using:

``` r
run_app()
```

Users can select a risk indicator and climate scenario to explore the
corresponding findings.

The application displays numerical estimates where available, alongside
research interpretations and important limitations.

## Interpreting the findings

The central climate-model estimate indicates that the probability of a
2019/20-level extreme fire-weather event under the present climate is
approximately 1.8 times the probability in the early twentieth-century
climate.

The conservative lower bound is approximately 1.3 times.

The ERA5 observational estimate is greater than four. However,
observational and model estimates should not be directly combined
because they do not overlap.

Under a climate scenario approximately 2°C warmer, the estimated
probability is approximately eight times higher, with a conservative
lower bound of approximately four times higher.

These future estimates are based on only two climate models and involve
substantial uncertainty.

## Important limitations

This package presents curated findings from published research. It does
not perform a new climate-model analysis.

Bushfire weather risk does not directly represent actual fire occurrence
or damage. Ignition, vegetation, exposure and vulnerability also
influence bushfire impacts.

Some findings are qualitative and do not have numerical estimates. These
are presented as research descriptions rather than numerical charts.

## Source

van Oldenborgh et al. (2021). Attribution of the Australian bushfire
risk to anthropogenic climate change. Natural Hazards and Earth System
Sciences, 21, 941–960.

<https://doi.org/10.5194/nhess-21-941-2021>
