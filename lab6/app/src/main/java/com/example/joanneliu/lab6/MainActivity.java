package com.example.joanneliu.lab6;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void sayView(View view){
        TextView lookText=(TextView)findViewById(R.id.message); //created TextView object called lookText
        EditText name = (EditText) findViewById(R.id.editText);
        String nameValue = name.getText().toString();
        lookText.setText("Hello "+ nameValue +", I am the world.");
    }

    public void toggleCute(View view) {
        ToggleButton toggle = findViewById(R.id.toggleButton);
        boolean location = toggle.isChecked();
        if(location){
            ImageView normal = (ImageView)findViewById(R.id.imageView);
            normal.setImageResource(R.drawable.world);
        }
        else {
            Context context = getApplicationContext();
            CharSequence text = "Kawaii means cute in Japanese!";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();

            ImageView normal = (ImageView)findViewById(R.id.imageView);
            normal.setImageResource(R.drawable.kawaii);
        }
    }

    public void mood(View view) {
        RadioGroup feeling = findViewById(R.id.radioGroup);
        int id = feeling.getCheckedRadioButtonId(); //returns id of radio button picked
        TextView helloText=(TextView)findViewById(R.id.hello);
        if (id == R.id.radioButton1){
            helloText.setText("Hello World.");
        }
        else if (id == R.id.radioButton2){
            helloText.setText("Hello World!");
        }
        else if (id == R.id.radioButton3){
            helloText.setText("HELLO WORLD!");
        }
        else {
            helloText.setText("hello world");
        }
    }


}
