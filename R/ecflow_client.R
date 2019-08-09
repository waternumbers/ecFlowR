#' ecflow_client wrappers
#'
#' @description Wrapper functions makeing system calls to the ecflow_client to interact with the ecflow_server
#'
#' @param pid process identifier to the current task
#' @param name name of the item to manipulate
#' @param value desired value for \code{name} to take
#' @param n event number
#'
#' @details These are very basic wrappers..
#'
#' @name ecflow_client
NULL

#' @rdname ecflow_client
#' @export
ecflow_init <- function(pid=Sys.getpid()){
    tmp <- system( paste0("ecflow_client --init=",pid))
#                         ,Sys.getpid()) )
    if(tmp > 0){
        stop(paste("ecflow_init failed with code",tmp))
    }
}

#' @rdname ecflow_client
#' @export
ecflow_abort <- function(pid=Sys.getpid()){
    tmp <- system( paste0("ecflow_client --abort=",pid))
   # ,Sys.getpid()) )
    if(tmp > 0){
        stop(paste("ecflow_abort failed with code",tmp))
    }
}

#' @rdname ecflow_client
#' @export
ecflow_complete <- function(){
    tmp <- system( "ecflow_client --complete" )
    if(tmp > 0){
        stop(paste("ecflow_complete failed with code",tmp))
    }
}

#' @rdname ecflow_client
#' @export
ecflow_meter <- function(name,value){
    tmp <- system( paste0("ecflow_client --meter=",name," ",value) )
    if(tmp > 0){
        stop(paste("ecflow_meter failed with code",tmp))
    }
}

#' @rdname ecflow_client
#' @export
ecflow_event <- function(n){
    tmp <- system( paste0("ecflow_client --event=",n))
    if(tmp > 0){
        stop(paste("ecflow_event failed with code",tmp))
    }
}

#' @rdname ecflow_client
#' @export
ecflow_label <- function(name,value){
    print(paste0("ecflow_client --label=",name,' "',value,'"'))
    tmp <- system( paste0("ecflow_client --label=",name,' "',value,'"') )
    if(tmp > 0){
        stop(paste("ecflow_label failed with code",tmp))
    }
}

#' @rdname ecflow_client
#' @export
ecflow_change <- function(name,value){
    tmp <- system( paste0('ecflow_client --alter=change variable ',name,' "',value,'" /^SUITE^') )
    if(tmp > 0){
        stop(paste("ecflow_change failed with code",tmp))
    }
}

