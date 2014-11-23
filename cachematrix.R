## Put comments here that give an overall description of what your
## functions do
##
## functions cache an inverted matrix, which may called for later use

##
## makeCacheMatrix creates a matrix and caches its inverse (if possible)

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  ## check if matrix 'x' is square (invertable)
  if (nrow(x) != ncol(x)) {
      print("Matrix must be square ...")     
      return (NULL)
  }
  ## accept data (matrix)
  set <- function (y){
      x <<- y
      inv <<- NULL
  }
  ## attach methods (ways) to data
  ## provide data passed in [get()]
  get <- function () x
  ## create inverse of matrix [setinv() x]
  setinv <- function (solve) {inv <<- solve}
  ## retrieve inverse of matrix [getinv() x]
  getinv <- function () inv
  ## provide call names (the 'how to use 'ways' ...')
  list (set = set, get = get,
        setinv = setinv,
        getinv = getinv)
}


## 
## Returns the inverse of matrix passed
## If cached inverse matrix is available, return it
## If cached version is not there, create, cache, and return it

## cacheSolve Returns the inverse of (matrix) 'x'
cacheSolve <- function(x, ...) {
    ## retrieve cahced inverse of matrix
    inv <- x$getinv()
    ## check if cached version available
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    ## no cached inverse matrix, create, cache & return inverse
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    ## return created, cached, inverse
    inv
}
