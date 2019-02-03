https://cran.r-project.org/web/packages/lme4/vignettes/lmer.pdf
https://bbolker.github.io/mixedmodels-misc/glmmFAQ.html


library(lme4)
baseline <- glmer(G_TOTAL ~ 1 + (1| ANIMAL:N_DEHORNINGS), 
                  df.cv.cows, 
                  family = gaussian(link="log")
                  )

modelNoRepeated <- glm(G_TOTAL ~ 1, 
                         df.cv.cows, 
                         family = gaussian(link="log"),
                       REML = 0)
anova(baseline, modelNoRepeated, test="LRT")
