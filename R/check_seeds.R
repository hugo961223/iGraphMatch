#' @title Standardize seeds input data type
#'
#' @description Convert the input seeds data into data frame type with the first column being the
#' indices of \eqn{G_1} and the second column being the corresponding indices of \eqn{G_2}
#'
#' @param seeds A vector of integers or logicals, a matrix or a data frame. If there is no error in seeds input can be
#' a vector of seed indices in \eqn{G_1}. Or if there exists error in seeds, input in the form of a
#' matrix or a data frame, with the first column being the indices of \eqn{G_1} and the second
#' column being the corresponding indices of \eqn{G_2}.
#' @param nv An integer. Number of total vertices.
#' @param logical An logical. TRUE indicates returns seeds in a vector of logicals where TRUE
#' indicates the corresponding vertex is a seed. FALSE indicates returns a data frame.
#'
#' @return returns a data frame with the first column being the corresponding indices of
#' \eqn{G_1} and the second column being the corresponding indices of \eqn{G_2} or a vector of
#' logicals where TRUE indicates the corresponding vertex is a seed.
#'
#' @examples
#' #input is a vector of logicals
#' seeds <- 1:10 <= 3
#' check_seeds(seeds)
#'
#' #input is a vector of integers
#' check_seeds(c(1,4,2,7,3))
#'
#' #input is a matrix
#' check_seeds(matrix(1:4,2))
#'
#' #input is a data frame
#' check_seeds(as.data.frame(matrix(1:4,2)))
#'
#' @export
check_seeds <- function(seeds, nv = 0, logical = FALSE){
  if(is.logical(seeds)){
    seeds <- which(seeds==TRUE)
    seed_g1 <- seeds
    seed_g2 <- seeds
  } else if(is.vector(seeds)){
    seed_g1 <- seeds
    seed_g2 <- seeds
  } else if(is.matrix(seeds)){
    seed_g1 <- seeds[,1]
    seed_g2 <- seeds[,2]
  } else{
    seeds <- as.matrix(seeds)
    seed_g1 <- seeds[,1]
    seed_g2 <- seeds[,2]
  }

  if(logical==TRUE){
    seeds <- rep(FALSE, nv)
    seeds[seed_g1] <- TRUE
    seeds
  } else{
    data.frame(seed_A=seed_g1, seed_B=seed_g2)
  }
}
