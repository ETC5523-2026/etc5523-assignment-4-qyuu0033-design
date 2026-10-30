# Australian Bushfire Weather Risk Findings

A curated dataset summarising findings on the attribution of Australian
bushfire weather risk to anthropogenic climate change.

## Usage

``` r
bushfire_risk
```

## Format

A tibble with 9 rows and 10 columns:

- indicator:

  Climate or weather indicator.

- scenario:

  Climate scenario or comparison period.

- evidence_type:

  Type of evidence used in the study.

- estimate_type:

  Type of reported estimate.

- ratio_value:

  Reported probability ratio or temperature increase.

- ratio_operator:

  Operator describing the reported estimate.

- comparison:

  Reference period or comparison.

- finding:

  Summary of the research finding.

- limitation:

  Important limitation or uncertainty.

- source:

  Original research source.

## Source

van Oldenborgh et al. (2021), Attribution of the Australian bushfire
risk to anthropogenic climate change.

## Examples

``` r
data(bushfire_risk)
head(bushfire_risk)
#> # A tibble: 6 × 10
#>   indicator      scenario evidence_type estimate_type ratio_value ratio_operator
#>   <chr>          <chr>    <chr>         <chr>               <dbl> <chr>         
#> 1 Extreme fire … Present… Climate model Central esti…         1.8 ~             
#> 2 Extreme fire … Present… Climate model Conservative…         1.3 ~             
#> 3 Extreme fire … Present… ERA5 observa… Observed est…         4   >             
#> 4 Extreme fire … 2C warm… Climate model Central esti…         8   ~             
#> 5 Extreme fire … 2C warm… Climate model Conservative…         4   ~             
#> 6 Extreme tempe… Long-te… Attribution … Minimum incr…         2   >=            
#> # ℹ 4 more variables: comparison <chr>, finding <chr>, limitation <chr>,
#> #   source <chr>
```
