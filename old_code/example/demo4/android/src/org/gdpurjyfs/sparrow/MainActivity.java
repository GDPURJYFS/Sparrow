package org.gdpurjyfs.sparrow;

import android.app.Activity;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.View;
import android.graphics.Color;

public class MainActivity extends org.qtproject.qt5.android.bindings.QtActivity
{
    public MainActivity()
    {
        QtBridgingAndroid.Init(this);
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);

            //! [0]
            //! 让整个 Activity 覆盖整个屏幕
            //! 并且系统栏位于整个 Activity 的上层
            getWindow()
                .getDecorView()
                .setSystemUiVisibility(
                            View.SYSTEM_UI_FLAG_LAYOUT_STABLE |
                            View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN);
            //! [0]

            //! [1]
            //! 设置系统的状态栏为透明
            //! 这两句必须
            //! 后续要拿到系统状态栏高度。
            getWindow().setStatusBarColor(Color.TRANSPARENT);
            getWindow().setNavigationBarColor(Color.TRANSPARENT);
            //! [1]
    }
}
