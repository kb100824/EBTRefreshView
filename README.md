# 旋转的指示器

#旋转指示器
        EBTRefreshView *refresh = [[EBTRefreshView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
        refresh.progressValue = 0.75;
        refresh.imageName = [UIImage imageNamed:@"1"];
        [refresh startAnimation];
        [self.view addSubview:refresh];

#停止旋转指示器

  [refresh stopAnimation];

#效果演示图
![Image](https://github.com/KBvsMJ/-/blob/master/demogif/1.gif)
