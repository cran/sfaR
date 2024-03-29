% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/logLik.R
\name{logLik}
\alias{logLik}
\alias{logLik.sfacross}
\alias{logLik.sfalcmcross}
\alias{logLik.sfaselectioncross}
\title{Extract log-likelihood value of stochastic frontier models}
\usage{
\method{logLik}{sfacross}(object, individual = FALSE, ...)

\method{logLik}{sfalcmcross}(object, individual = FALSE, ...)

\method{logLik}{sfaselectioncross}(object, individual = FALSE, ...)
}
\arguments{
\item{object}{A stochastic frontier model returned
by \code{\link{sfacross}}, \code{\link{sfalcmcross}}, or
\code{\link{sfaselectioncross}}.}

\item{individual}{Logical. If \code{FALSE} (default), the sum of all
observations' log-likelihood values is returned. If \code{TRUE}, a vector of
each observation's log-likelihood value is returned.}

\item{...}{Currently ignored.}
}
\value{
\code{\link{logLik}} returns either an object of class
\code{'logLik'}, which is the log-likelihood value with the total number of
observations (\code{nobs}) and the number of free parameters (\code{df}) as
attributes, when \code{individual = FALSE}, or a list of elements, containing
the log-likelihood of each observation (\code{logLik}), the total number of
observations (\code{Nobs}) and the number of free parameters (\code{df}),
when \code{individual = TRUE}.
}
\description{
\code{\link{logLik}} extracts the log-likelihood value(s) from stochastic
frontier models estimated with \code{\link{sfacross}}, \code{\link{sfalcmcross}},
or \code{\link{sfaselectioncross}}.
}
\examples{

\dontrun{
## Using data on fossil fuel fired steam electric power generation plants in the U.S.
# Translog SFA (cost function) truncated normal with scaling property
tl_u_ts <- sfacross(formula = log(tc/wf) ~ log(y) + I(1/2 * (log(y))^2) +
log(wl/wf) + log(wk/wf) + I(1/2 * (log(wl/wf))^2) + I(1/2 * (log(wk/wf))^2) +
I(log(wl/wf) * log(wk/wf)) + I(log(y) * log(wl/wf)) + I(log(y) * log(wk/wf)),
udist = 'tnormal', muhet = ~ regu, uhet = ~ regu, data = utility, S = -1,
scaling = TRUE, method = 'mla')
logLik(tl_u_ts)

## Using data on eighty-two countries production (GDP)
# LCM Cobb Douglas (production function) half normal distribution
cb_2c_h <- sfalcmcross(formula = ly ~ lk + ll + yr, udist = 'hnormal', 
data = worldprod, S = 1)
logLik(cb_2c_h, individual = TRUE)
}

}
\seealso{
\code{\link{sfacross}}, for the stochastic frontier analysis model
fitting function using cross-sectional or pooled data.

\code{\link{sfalcmcross}}, for the latent class stochastic frontier analysis
model fitting function using cross-sectional or pooled data.

\code{\link{sfaselectioncross}} for sample selection in stochastic frontier
model fitting function using cross-sectional or pooled data.
}
\keyword{likelihood}
\keyword{methods}
