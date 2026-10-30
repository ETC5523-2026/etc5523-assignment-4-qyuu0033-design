#' Australian Bushfire Weather Risk Findings
#'
#' A curated dataset summarising findings on the attribution
#' of Australian bushfire weather risk to anthropogenic
#' climate change.
#'
#' @format A tibble with 9 rows and 10 columns:
#' \describe{
#'   \item{indicator}{Climate or weather indicator.}
#'   \item{scenario}{Climate scenario or comparison period.}
#'   \item{evidence_type}{Type of evidence used in the study.}
#'   \item{estimate_type}{Type of reported estimate.}
#'   \item{ratio_value}{Reported probability ratio or temperature increase.}
#'   \item{ratio_operator}{Operator describing the reported estimate.}
#'   \item{comparison}{Reference period or comparison.}
#'   \item{finding}{Summary of the research finding.}
#'   \item{limitation}{Important limitation or uncertainty.}
#'   \item{source}{Original research source.}
#' }
#'
#' @source van Oldenborgh et al. (2021),
#' Attribution of the Australian bushfire risk to anthropogenic climate change.
#'
#' @examples
#' data(bushfire_risk)
#' head(bushfire_risk)
"bushfire_risk"