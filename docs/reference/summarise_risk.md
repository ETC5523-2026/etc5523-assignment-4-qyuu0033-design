# Summarise Australian Bushfire Weather Risk

Filters bushfire risk findings by indicator and climate scenario.

## Usage

``` r
summarise_risk(data, selected_indicator = NULL, selected_scenario = NULL)
```

## Arguments

- data:

  A data frame containing bushfire risk findings.

- selected_indicator:

  Optional indicator to select.

- selected_scenario:

  Optional climate scenario to select.

## Value

A filtered data frame containing the selected findings.

## Examples

``` r
summarise_risk(
  bushfire_risk,
  selected_indicator = "Extreme fire weather",
  selected_scenario = "Present climate"
)
#> # A tibble: 3 × 10
#>   indicator      scenario evidence_type estimate_type ratio_value ratio_operator
#>   <chr>          <chr>    <chr>         <chr>               <dbl> <chr>         
#> 1 Extreme fire … Present… Climate model Central esti…         1.8 ~             
#> 2 Extreme fire … Present… Climate model Conservative…         1.3 ~             
#> 3 Extreme fire … Present… ERA5 observa… Observed est…         4   >             
#> # ℹ 4 more variables: comparison <chr>, finding <chr>, limitation <chr>,
#> #   source <chr>
```
