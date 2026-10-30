# Create bushfire risk dataset
# Based on findings summarised in Assignment 2
# Source: van Oldenborgh et al. (2021)

bushfire_risk <- tibble(
  
  indicator = c(
    "Extreme fire weather",
    "Extreme fire weather",
    "Extreme fire weather",
    "Extreme fire weather",
    "Extreme fire weather",
    "Extreme temperature",
    "Extreme drought",
    "Driest month",
    "Natural climate variability"
  ),
  
  scenario = c(
    "Present climate",
    "Present climate",
    "Present climate",
    "2C warmer climate",
    "2C warmer climate",
    "Long-term warming",
    "Fire season",
    "September-February",
    "2019 drought conditions"
  ),
  
  evidence_type = c(
    "Climate model",
    "Climate model",
    "ERA5 observation",
    "Climate model",
    "Climate model",
    "Attribution analysis",
    "Attribution analysis",
    "Attribution analysis",
    "Climate variability analysis"
  ),
  
  estimate_type = c(
    "Central estimate",
    "Conservative lower bound",
    "Observed estimate",
    "Central estimate",
    "Conservative lower bound",
    "Minimum increase",
    "Qualitative finding",
    "Qualitative finding",
    "Qualitative finding"
  ),
  
  ratio_value = c(
    1.8,
    1.3,
    4,
    8,
    4,
    2,
    NA_real_,
    NA_real_,
    NA_real_
  ),
  
  ratio_operator = c(
    "~",
    "~",
    ">",
    "~",
    "~",
    ">=",
    NA_character_,
    NA_character_,
    NA_character_
  ),
  
  comparison = c(
    "Relative to early 20th century climate",
    "Relative to early 20th century climate",
    "Relative to early 20th century climate",
    "Relative to early 20th century climate",
    "Relative to early 20th century climate",
    "Long-term warming comparison",
    "No attributable trend identified",
    "No attributable trend identified",
    "July-December drought anomaly"
  ),
  
  finding = c(
    "Extreme fire-weather probability increased by approximately 80%.",
    "The conservative lower bound indicates an increase of approximately 30%.",
    "ERA5 analysis indicated a probability ratio greater than four.",
    "Probability of a 2019/20-level event is approximately eight times higher.",
    "The conservative lower bound is approximately four times higher.",
    "Extreme heat became at least twice as likely.",
    "No attributable trend was identified in extreme annual drought.",
    "No attributable trend was identified in the driest fire-season month.",
    "IOD and SAM contributed substantially to the drought conditions."
  ),
  
  limitation = c(
    "Model estimate; observational and model estimates did not overlap.",
    "Conservative lower bound, not an exact estimate.",
    "ERA5 estimate should not be directly combined with model estimates.",
    "Future estimate was based on only two climate models.",
    "Future estimate has substantial model uncertainty.",
    "Do not interpret as a measure of actual bushfire occurrence.",
    "Climate change attribution was not identified for this variable.",
    "Climate change attribution was not identified for this variable.",
    "Natural variability is only one component of the event."
  ),
  
  source = rep(
    "van Oldenborgh et al. (2021)",
    9
  )
)

# Display the dataset
print(bushfire_risk)


# Check the structure
glimpse(bushfire_risk)

# Check missing values
colSums(is.na(bushfire_risk))

# Save dataset into the R package
usethis::use_data(
  bushfire_risk,
  overwrite = TRUE
)
