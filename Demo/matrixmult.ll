; ModuleID = 'matrixmult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@N = constant i32 1000, align 4
@A = common global [1000 x [1000 x i32]] zeroinitializer, align 16
@B = common global [1000 x [1000 x i32]] zeroinitializer, align 16
@C = common global [1000 x [1000 x i32]] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 100, i32* %a, align 4
  store i32 200, i32* %b, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc.12, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 1000
  br i1 %cmp, label %for.body, label %for.end.14

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond.1

for.cond.1:                                       ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 1000
  br i1 %cmp2, label %for.body.3, label %for.end

for.body.3:                                       ; preds = %for.cond.1
  %call = call i32 @rand() #2
  %rem = srem i32 %call, 50
  %2 = load i32, i32* %j, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @A, i32 0, i64 %idxprom4
  %arrayidx5 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx, i32 0, i64 %idxprom
  store i32 %rem, i32* %arrayidx5, align 4
  %call6 = call i32 @rand() #2
  %rem7 = srem i32 %call6, 50
  %4 = load i32, i32* %j, align 4
  %idxprom8 = sext i32 %4 to i64
  %5 = load i32, i32* %i, align 4
  %idxprom9 = sext i32 %5 to i64
  %arrayidx10 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @B, i32 0, i64 %idxprom9
  %arrayidx11 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx10, i32 0, i64 %idxprom8
  store i32 %rem7, i32* %arrayidx11, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body.3
  %6 = load i32, i32* %j, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond.1

for.end:                                          ; preds = %for.cond.1
  br label %for.inc.12

for.inc.12:                                       ; preds = %for.end
  %7 = load i32, i32* %i, align 4
  %inc13 = add nsw i32 %7, 1
  store i32 %inc13, i32* %i, align 4
  br label %for.cond

for.end.14:                                       ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond.15

for.cond.15:                                      ; preds = %for.inc.51, %for.end.14
  %8 = load i32, i32* %i, align 4
  %cmp16 = icmp slt i32 %8, 1000
  br i1 %cmp16, label %for.body.17, label %for.end.53

for.body.17:                                      ; preds = %for.cond.15
  store i32 0, i32* %j, align 4
  br label %for.cond.18

for.cond.18:                                      ; preds = %for.inc.48, %for.body.17
  %9 = load i32, i32* %j, align 4
  %cmp19 = icmp slt i32 %9, 1000
  br i1 %cmp19, label %for.body.20, label %for.end.50

for.body.20:                                      ; preds = %for.cond.18
  %10 = load i32, i32* %j, align 4
  %idxprom21 = sext i32 %10 to i64
  %11 = load i32, i32* %i, align 4
  %idxprom22 = sext i32 %11 to i64
  %arrayidx23 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @C, i32 0, i64 %idxprom22
  %arrayidx24 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx23, i32 0, i64 %idxprom21
  store i32 0, i32* %arrayidx24, align 4
  store i32 0, i32* %k, align 4
  br label %for.cond.25

for.cond.25:                                      ; preds = %for.inc.45, %for.body.20
  %12 = load i32, i32* %k, align 4
  %cmp26 = icmp slt i32 %12, 1000
  br i1 %cmp26, label %for.body.27, label %for.end.47

for.body.27:                                      ; preds = %for.cond.25
  %13 = load i32, i32* %j, align 4
  %idxprom28 = sext i32 %13 to i64
  %14 = load i32, i32* %i, align 4
  %idxprom29 = sext i32 %14 to i64
  %arrayidx30 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @C, i32 0, i64 %idxprom29
  %arrayidx31 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx30, i32 0, i64 %idxprom28
  %15 = load i32, i32* %arrayidx31, align 4
  %16 = load i32, i32* %k, align 4
  %idxprom32 = sext i32 %16 to i64
  %17 = load i32, i32* %i, align 4
  %idxprom33 = sext i32 %17 to i64
  %arrayidx34 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @A, i32 0, i64 %idxprom33
  %arrayidx35 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx34, i32 0, i64 %idxprom32
  %18 = load i32, i32* %arrayidx35, align 4
  %19 = load i32, i32* %j, align 4
  %idxprom36 = sext i32 %19 to i64
  %20 = load i32, i32* %k, align 4
  %idxprom37 = sext i32 %20 to i64
  %arrayidx38 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @B, i32 0, i64 %idxprom37
  %arrayidx39 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx38, i32 0, i64 %idxprom36
  %21 = load i32, i32* %arrayidx39, align 4
  %add = add nsw i32 %18, %21
  %add40 = add nsw i32 %15, %add
  %22 = load i32, i32* %j, align 4
  %idxprom41 = sext i32 %22 to i64
  %23 = load i32, i32* %i, align 4
  %idxprom42 = sext i32 %23 to i64
  %arrayidx43 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @C, i32 0, i64 %idxprom42
  %arrayidx44 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx43, i32 0, i64 %idxprom41
  store i32 %add40, i32* %arrayidx44, align 4
  br label %for.inc.45

for.inc.45:                                       ; preds = %for.body.27
  %24 = load i32, i32* %k, align 4
  %inc46 = add nsw i32 %24, 1
  store i32 %inc46, i32* %k, align 4
  br label %for.cond.25

for.end.47:                                       ; preds = %for.cond.25
  br label %for.inc.48

for.inc.48:                                       ; preds = %for.end.47
  %25 = load i32, i32* %j, align 4
  %inc49 = add nsw i32 %25, 1
  store i32 %inc49, i32* %j, align 4
  br label %for.cond.18

for.end.50:                                       ; preds = %for.cond.18
  br label %for.inc.51

for.inc.51:                                       ; preds = %for.end.50
  %26 = load i32, i32* %i, align 4
  %inc52 = add nsw i32 %26, 1
  store i32 %inc52, i32* %i, align 4
  br label %for.cond.15

for.end.53:                                       ; preds = %for.cond.15
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.1 (tags/RELEASE_371/final)"}
