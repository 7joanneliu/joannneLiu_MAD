package com.example.joanneliu.lab7;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

public class fwdForward extends Activity {

    private forwarded site = new forwarded();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fwd_forward);

        //get button
        Button button = findViewById(R.id.button);
        //create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                findForward(view);
            }
        };
        //add listener to button
        button.setOnClickListener(onclick);
    }

    private void findForward(View view){
//        site.setForwarded();
        String nameURL = site.getForwardedName();
        String forwardedURL = site.getForwardedURL();
        //Log.i("name", nameURL);
        //Log.i("url", forwardedURL);

        //create intent
        Intent intent = new Intent(this, ReceiveForwardActivity.class);

        //pass data
        intent.putExtra("forwardedName", nameURL);
        intent.putExtra("forwardedURL", forwardedURL);

        //start intent
        startActivity(intent);
    }
}

