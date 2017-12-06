; ModuleID = 'matrixmult_mem2reg.ll'
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv4t--linux-gnueabi"

@N = constant i32 500, align 4
@A = common global [1000 x [1000 x i32]] zeroinitializer, align 4
@B = common global [1000 x [1000 x i32]] zeroinitializer, align 4
@C = common global [1000 x [1000 x i32]] zeroinitializer, align 4

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc.9, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc10, %for.inc.9 ]
  %cmp = icmp slt i32 %i.0, 500
  br i1 %cmp, label %for.body, label %for.end.11

for.body:                                         ; preds = %for.cond
  br label %for.cond.1

for.cond.1:                                       ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %cmp2 = icmp slt i32 %j.0, 500
  br i1 %cmp2, label %for.body.3, label %for.end

for.body.3:                                       ; preds = %for.cond.1
  %call = call i32 @rand() #1
  %rem = srem i32 %call, 50
  %arrayidx = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @A, i32 0, i32 %i.0
  %arrayidx4 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx, i32 0, i32 %j.0
  store i32 %rem, i32* %arrayidx4, align 4
  %call5 = call i32 @rand() #1
  %rem6 = srem i32 %call5, 50
  %arrayidx7 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @B, i32 0, i32 %i.0
  %arrayidx8 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx7, i32 0, i32 %j.0
  store i32 %rem6, i32* %arrayidx8, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body.3
  %inc = add nsw i32 %j.0, 1
  br label %for.cond.1

for.end:                                          ; preds = %for.cond.1
  br label %for.inc.9

for.inc.9:                                        ; preds = %for.end
  %inc10 = add nsw i32 %i.0, 1
  br label %for.cond

for.end.11:                                       ; preds = %for.cond
  br label %for.cond.12

for.cond.12:                                      ; preds = %for.inc.38, %for.end.11
  %i.1 = phi i32 [ 0, %for.end.11 ], [ %inc39, %for.inc.38 ]
  %cmp13 = icmp slt i32 %i.1, 500
  br i1 %cmp13, label %for.body.14, label %for.end.40

for.body.14:                                      ; preds = %for.cond.12
  br label %for.cond.15

for.cond.15:                                      ; preds = %for.inc.35, %for.body.14
  %j.1 = phi i32 [ 0, %for.body.14 ], [ %inc36, %for.inc.35 ]
  %cmp16 = icmp slt i32 %j.1, 500
  br i1 %cmp16, label %for.body.17, label %for.end.37

for.body.17:                                      ; preds = %for.cond.15
  %arrayidx18 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @C, i32 0, i32 %i.1
  %arrayidx19 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx18, i32 0, i32 %j.1
  store i32 0, i32* %arrayidx19, align 4
  br label %for.cond.20

for.cond.20:                                      ; preds = %for.inc.32, %for.body.17
  %k.0 = phi i32 [ 0, %for.body.17 ], [ %inc33, %for.inc.32 ]
  %cmp21 = icmp slt i32 %k.0, 500
  br i1 %cmp21, label %for.body.22, label %for.end.34

for.body.22:                                      ; preds = %for.cond.20
  %arrayidx23 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @C, i32 0, i32 %i.1
  %arrayidx24 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx23, i32 0, i32 %j.1
  %0 = load i32, i32* %arrayidx24, align 4
  %arrayidx25 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @A, i32 0, i32 %i.1
  %arrayidx26 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx25, i32 0, i32 %k.0
  %1 = load i32, i32* %arrayidx26, align 4
  %arrayidx27 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @B, i32 0, i32 %k.0
  %arrayidx28 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx27, i32 0, i32 %j.1
  %2 = load i32, i32* %arrayidx28, align 4
  %add = add nsw i32 %1, %2
  %add29 = add nsw i32 %0, %add
  %arrayidx30 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @C, i32 0, i32 %i.1
  %arrayidx31 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx30, i32 0, i32 %j.1
  store i32 %add29, i32* %arrayidx31, align 4
  br label %for.inc.32

for.inc.32:                                       ; preds = %for.body.22
  %inc33 = add nsw i32 %k.0, 1
  br label %for.cond.20

for.end.34:                                       ; preds = %for.cond.20
  br label %for.inc.35

for.inc.35:                                       ; preds = %for.end.34
  %inc36 = add nsw i32 %j.1, 1
  br label %for.cond.15

for.end.37:                                       ; preds = %for.cond.15
  br label %for.inc.38

for.inc.38:                                       ; preds = %for.end.37
  %inc39 = add nsw i32 %i.1, 1
  br label %for.cond.12

for.end.40:                                       ; preds = %for.cond.12
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() #0

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm7tdmi" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"min_enum_size", i32 4}
!2 = !{!"clang version 3.7.0 (tags/RELEASE_370/final)"}
