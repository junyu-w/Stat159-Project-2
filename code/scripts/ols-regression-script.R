# read in data
train_data <- read.csv("data/train-data.csv")
test_data <- read.csv("data/test-data.csv")
full_data <- read.csv("data/scaled-credit.csv")

# train model based on train data
ols.mod <- lm(Balance~., data = train_data[,-1])
# predict on test set
target_y <- test_data$Balance
ols.pred <- predict(ols.mod, test_data[,c(-1,-13)])
ols_mse <- mean((ols.pred - target_y)^2)

# fit model with full data
ols_official_fit <- lm(Balance~., data = full_data[,-1])
ols_coeff <- coef(ols_official_fit)

save(ols.mod, ols_mse, ols_official_fit, ols_coeff, file = "data/regressions/ols-model.RData")