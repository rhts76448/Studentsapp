package com.example.demo;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ProgressBar;
import android.widget.Toast;

public class WebActivity extends Activity {

	private static final int TIME_DELAY = 2000;
    private static long back_pressed;
    private ValueCallback<Uri> mUploadMessage;
    public ValueCallback<Uri[]> uploadMessage;
    public static final int REQUEST_SELECT_FILE = 100;
    private final static int FILECHOOSER_RESULTCODE = 1;
    //int y=16;
  //  private Context mContext;
  //  private Activity mActivity;
    private ProgressBar mProgressBar;
    
	@SuppressLint({ "NewApi", "SetJavaScriptEnabled" })
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		
		 requestWindowFeature(Window.FEATURE_ACTION_BAR);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_web);
		  // Get the application context
       // mContext = getApplicationContext();
        // Get the activity
       // mActivity = MainActivity.this;
			String s=getIntent().getStringExtra("ip");
		String url="http://"+s+":8086/StudentsApp";
		WebView view=(WebView) this.findViewById(R.id.view);
		mProgressBar = (ProgressBar) findViewById(R.id.pb);

		view.getSettings().setJavaScriptEnabled(true);
		view.loadUrl(url);
		view.setWebViewClient(new WebViewClient()
				{
			@SuppressWarnings("deprecation")
			@Override
			public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
			    super.onReceivedError(view, errorCode, description, failingUrl);
			   // ++y;
			   // new Activity().recreate();
			   view.loadUrl("about:blank");
			}
			 @Override
	            public void onPageStarted(WebView view, String url, Bitmap favicon){
	                mProgressBar.setVisibility(View.VISIBLE);
	            }

	            @Override
	            public void onPageFinished(WebView view, String url){
	                mProgressBar.setVisibility(View.GONE);
	            }

				});
		view.setWebChromeClient(new WebChromeClient()
		{
			// For 3.0+ Devices (Start)
			// onActivityResult attached before constructor
			@SuppressWarnings("unused")
			protected void openFileChooser(ValueCallback uploadMsg, String acceptType)
			{
			    mUploadMessage = uploadMsg;
			    Intent i = new Intent(Intent.ACTION_GET_CONTENT);
			    i.addCategory(Intent.CATEGORY_OPENABLE);
			    i.setType("image/*");
			    startActivityForResult(Intent.createChooser(i, "File Browser"), FILECHOOSER_RESULTCODE);
			}


			// For Lollipop 5.0+ Devices
			public boolean onShowFileChooser(WebView mWebView, ValueCallback<Uri[]> filePathCallback, WebChromeClient.FileChooserParams fileChooserParams)
			{
			    if (uploadMessage != null) {
			        uploadMessage.onReceiveValue(null);
			        uploadMessage = null;
			    }

			    uploadMessage = filePathCallback;

			    Intent intent = fileChooserParams.createIntent();
			    try
			    {
			        startActivityForResult(intent, REQUEST_SELECT_FILE);
			    } catch (ActivityNotFoundException e)
			    {
			        uploadMessage = null;
			        Toast.makeText(getBaseContext(), "Cannot Open File Chooser", Toast.LENGTH_SHORT).show();
			        return false;
			    }
			    return true;
			}});

	}

	@SuppressLint("NewApi")
	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent intent)
	{
	    if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP)
	    {
	        if (requestCode == REQUEST_SELECT_FILE)
	        {
	            if (uploadMessage == null)
	                return;
	                uploadMessage.onReceiveValue(WebChromeClient.FileChooserParams.parseResult(resultCode, intent));
	        uploadMessage = null;
	    }
	}
	else if (requestCode == FILECHOOSER_RESULTCODE)
	{
	    if (null == mUploadMessage)
	        return;
	// Use MainActivity.RESULT_OK if you're implementing WebView inside Fragment
	// Use RESULT_OK only if you're implementing WebView inside an Activity
	    Uri result = intent == null || resultCode != WebActivity.RESULT_OK ? null : intent.getData();
	    mUploadMessage.onReceiveValue(result);
	    mUploadMessage = null;
	}
	else
	    Toast.makeText(getBaseContext(), "Failed to Upload Image", Toast.LENGTH_SHORT).show();
	}
	    		
	 @Override
	    public void onBackPressed() {
	        if (back_pressed + TIME_DELAY > System.currentTimeMillis()) {
	            super.onBackPressed();
	        } else {
	            Toast.makeText(getBaseContext(), "Press once again to exit!",
	                    Toast.LENGTH_SHORT).show();
	        }
	        back_pressed = System.currentTimeMillis();
	    }
	 
	 @Override
		public boolean onCreateOptionsMenu(Menu menu) {
			// Inflate the menu; this adds items to the action bar if it is present.
			getMenuInflater().inflate(R.menu.web, menu);
			return true;
		}

		@Override
		public boolean onOptionsItemSelected(MenuItem item) {
			// Handle action bar item clicks here. The action bar will
			// automatically handle clicks on the Home/Up button, so long
			// as you specify a parent activity in AndroidManifest.xml.
			int id = item.getItemId();
			if (id == R.id.action_settings) {
				return true;
			}
			return super.onOptionsItemSelected(item);
		}
	
}