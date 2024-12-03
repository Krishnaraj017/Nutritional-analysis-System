
int flag = 0;

int year(int y) {
  if (y % 400 == 0 || y % 4 == 0 && y % 100 != 0) {
    return 1;
  }
  return 0;
}

int month(int m, int y) {
  switch (m) {
    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
      return 31;
    case 4:
    case 6:
    case 9:
    case 11:
      return 30;
    case 2:
      if (year(y) == 1) {
        return 29;
      } else {
        return 28;
      }
    default:
      return 0;
  }
}

int getNoOfDays(int m, int y) {
  switch (m) {
    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
      return 31;
    case 4:
    case 6:
    case 9:
    case 11:
      return 30;
    case 2:
      if (year(y) == 1) {
        return 29;
      } else {
        return 28;
      }
    default:
      return 0;
  }
}

int height(int unit) {
  if (unit == 0.0) {
    return 300;
  } else {
    return 8;
  }
}

int userWeight(int unit) {
  if (unit == 0) {
    return 180;
  } else {
    return 95;
  }
}

String getNoString(int num) {
  if (num >= 10) {
    return num.toString();
  } else {
    return "0$num";
  }
}
