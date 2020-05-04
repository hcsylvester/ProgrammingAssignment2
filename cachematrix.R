## These two functions will cache the inverse of a matrix to save on computing time
## makeCacheMatrix caches matrix input
## cacheSolve returns the matrix

## Will cache the matrix input

makeCacheMatrix <- function(x = matrix()) {
        
        #prepare the cached Matrix by setting to NULL
        m <- NULL
        
        #The function  will be method below
        set <- function(x) {
                x <<- y
                m <<- NULL
        }
        
        #Retrieve matrix 
        #Will return the matrix specified
        get <- function() {
                x
        }
        
        #Solve for the inverse
        setMatrix <- function(solve) {
                m <<- solve
        }
        
        #Retrieve Inverse Matrix
        getMatrix <- function() {
                m
        }
        #Returns a list of the different functions
        list(set = set, get = get, setMatrix = setMatrix, getMatrix = getMatrix)
        
}


## Will return the inverse of matrix input and incorporate cache if possible

cacheSolve <- function(x, ...) {
        
        #Returns matrix input
        m <- x$getMatrix()
        
        #Checks to see if in cache
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        
        #If not in cache then gets matrix input
        data <- x$get()
        
        #Finds inverse of matrix
        m <- solve(data)
        x$setMatrix(m)
        
        #Returns the inverse matrix
        m
        
}

