package com.example.joanneliu.lab7;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;

public class ReceiveForwardActivity extends Activity {

    private String forwardedName;
    private String forwardedURL;

    @SuppressLint("SetTextI18n")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_receive_forward);

        //get intent
        Intent intent = getIntent();
        forwardedName = intent.getStringExtra("forwardedName");
        forwardedURL = intent.getStringExtra("forwardedURL");
//        Log.i("name recieved", forwardedName);
  //      Log.i("url recieved", forwardedURL);

        ImageButton imageButton = findViewById(R.id.imageButton);
        //create listener
        View.OnClickListener onclick = new View.OnClickListener() {
            public void onClick(View view) {
                loadWebsite();
            }
        };
        //    add listener to button
        imageButton.setOnClickListener(onclick);
    }


    private void loadWebsite(){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(forwardedURL));
        startActivity(intent);
    }
}
