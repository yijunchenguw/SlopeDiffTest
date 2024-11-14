## Preliminaries ----
### Call libraries ----
library(lme4) # model
library(SlopeDiffTest)

### Load raw dataset ----
data("mlbook_red_b_subset")

## Model ----
Ex1_model <- lmer(aritPOST ~ 1 + ZlangPOST_CMC + ZIQ_verb_CMC + Zses_CMC
                  + ZlangPOST_agg + ZIQ_verb_agg + Zses_agg
                  + (1|schoolnr),
                  data = mlbook_red_b_subset, REML = FALSE, control = lmerControl(optimizer="nloptwrap"))

## Run Slopediff_all_pairs test
slopediff_all_pairs(Ex1_model)

