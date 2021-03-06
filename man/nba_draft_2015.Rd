% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{nba_draft_2015}
\alias{nba_draft_2015}
\title{Projecting The Top 50 Players In The 2015 NBA Draft Class}
\format{
A data frame with 1090 rows representing National Basketball Association players/prospects and 9 variables:
\describe{
  \item{player}{Player name}
  \item{position}{The player's position going into the draft}
  \item{id}{The player's identification code}
  \item{draft_year}{The year the player was eligible for the NBA draft}
  \item{projected_spm}{The model's projected statistical plus/minus over years 2-5 of the player's NBA career}
  \item{superstar}{Probability of becoming a superstar player (1 per draft, SPM >= +3.3)}
  \item{starter}{Probability of becoming a starting-caliber player (10 per draft, SPM >= +0.5)}
  \item{role_player}{Probability of becoming a role player (25 per draft, SPM >= -1.4)}
  \item{bust}{Probability of becoming a bust (everyone else, SPM < -1.4)}
}
}
\source{
See \url{https://fivethirtyeight.com/features/projecting-the-top-50-players-in-the-2015-nba-draft-class/}
}
\usage{
nba_draft_2015
}
\description{
The raw data behind the story
"Projecting The Top 50 Players In The 2015 NBA Draft Class"
\url{https://fivethirtyeight.com/features/projecting-the-top-50-players-in-the-2015-nba-draft-class/}.
An analysis using this data was contributed by G. Elliott Morris as a package vignette at
\url{https://fivethirtyeightdata.github.io/fivethirtyeightdata/articles/NBA.html}.
}
\keyword{datasets}
