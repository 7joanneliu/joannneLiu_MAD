package com.example.joanneliu.lab5;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void sayLook(View view){
            TextView lookText=(TextView)findViewById(R.id.message); //created TextView object called lookText
            EditText name = (EditText) findViewById(R.id.editText);
            String nameValue = name.getText().toString();
            lookText.setText("Look "+ nameValue +" Pizza Cat!");
            ImageView pizza=(ImageView)findViewById(R.id.imageView);
            pizza.setImageResource(R.drawable.pizza_cat);
    }

}
