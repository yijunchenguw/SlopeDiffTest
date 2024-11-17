## Preliminaries ----
## install R pacakge
user    <- "yijunchenguw"
repo    <- "SlopeDiffTest"
branch  <- "main"
fname   <- "SlopeDiffTest_1.0.1.tar.gz"
pkg_url <- paste("https://raw.github.com", user, repo, branch, fname, sep = "/")
install.packages(pkg_url, repos = NULL)
### Call libraries ----
library(lme4) # model
library(SlopeDiffTest)
library(lmerTest)

### Load raw dataset ----
data("mlbook_red_b_subset")

## Model ----
Ex1_model <- lmer(aritPOST ~ 1 + ZlangPOST_CMC + ZIQ_verb_CMC + Zses_CMC
                  + ZlangPOST_agg + ZIQ_verb_agg + Zses_agg
                  + (1|schoolnr),
                  data = mlbook_red_b_subset, REML = FALSE, control = lmerControl(optimizer="nloptwrap"))

## summary of the model ----
options(scipen=999)
summary(Ex1_model)

## Run Slopediff_all_pairs test
slopediff_all_pairs(Ex1_model)

