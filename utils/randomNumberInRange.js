export default (min = 0, max = 100, rounded = true) => {
  const randomNumber = Math.random() * (max - min + 1) + min;
  return rounded ? Math.floor(randomNumber) : randomNumber;
}
