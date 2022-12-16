#' Get Multiple Dapps
#' @description Get Multiple Dapps <https://api-portal.dappradar.com/catalog/prd_p77wm84fbe4gteuu/endpoint/fltr_K56Bb9ncytxQO1X2egHdDn5ljwxhljng>
#' @importFrom glue glue
#' @importFrom httr add_headers content GET
#'
#' @param base_url_token Token included into Base URL
#' @param chain Chain to search for dapps
#' @param page Page of search results
#' @param resultsPerPage Expected results per page
#' @param api_key API key
#'
#' @export

dr_dapps <- function(base_url_token, chain = NULL, page = NULL, resultsPerPage = NULL, api_key) {
  dapps <- GET(glue("https://api.dappradar.com/{base_url_token}/dapps"),
               query = list(chain = chain,
                            page = page,
                            resultsPerPage = resultsPerPage),
               add_headers("X-BLOBR-KEY" = api_key))

  if (dapps$status_code != 200) {
    stop(paste0("Error code ", dapps$status_code, ": ", content(dapps)$message))
  }

  content(dapps)
}
