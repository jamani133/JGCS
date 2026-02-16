float snapRound(float a, float step){
    return round(a/step)* step;
}
float snapDown(float a, float step){
    return floor(a/step)* step;
}
float snapUp(float a, float step){
    return ceil(a/step)* step;
}

PVector snapDown2D(PVector a, PVector step){
    return new PVector(snapDown(a.x,step.x),snapDown(a.y,step.y));
}
PVector snapUp2D(PVector a, PVector step){
    return new PVector(snapUp(a.x,step.x),snapUp(a.y,step.y));
}
PVector snapRound2D(PVector a, PVector step){
    return new PVector(snapRound(a.x,step.x),snapRound(a.y,step.y));
}
