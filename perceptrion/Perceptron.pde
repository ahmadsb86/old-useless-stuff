class Perceptron {

  int threshold = 0;
  int numIn = 0;
  float[] weights = new float[2];
  float[] inputs = new float[2];

  Perceptron(int t, int i) {
    threshold = t;
    numIn = i;
    randomize();
  }



  void randomize() {
    for (int i = 0; i < numIn; i++) {
      weights[i] = random(-1, 1);
    }
  }

  void giveInput(float num1, float num2) {
    inputs[0] = num1;
    if (numIn == 2) {
      inputs[1] = num2;
    }
  }

  int guess() {

    float sum = 0;
    for (int i = 0; i < numIn; i++) {
      sum += weights[i] * inputs[i];
    }

    //activation function
    sum = sign(sum);
    return int(sum);
  }

  void train() {

    float lr = 1;
    float guess = guess();
    int correct = solve(inputs);

    for (int i = 0; i < numIn; i++) {

      //calculate error
      float error = (correct - guess) * lr;

      //tweak weights based on error
      weights[i] += error;
    }
  }

  int solve(float[] input) {

    if (numIn == 1) {
      return int(input[0] * - 1);
    }
    if (input[0] + input[1] >= threshold) {
      return 1;
    }
    if (input[0] + input[1] < threshold) {
      return 0;
    }
    exit();
    return 1000;
  }
}