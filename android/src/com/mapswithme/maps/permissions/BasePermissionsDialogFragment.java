package com.mapswithme.maps.permissions;

import android.app.Dialog;
import android.os.Bundle;
import android.support.annotation.IdRes;
import android.support.annotation.LayoutRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.view.View;
import android.view.Window;

import com.mapswithme.maps.base.BaseMwmDialogFragment;
import com.mapswithme.util.PermissionsUtils;

abstract class BasePermissionsDialogFragment extends BaseMwmDialogFragment
    implements View.OnClickListener
{
  private static final String REQUEST_ID = "arg_request_id";

  private int mRequestId;

  @SuppressWarnings("TryWithIdenticalCatches")
  @Nullable
  public static DialogFragment show(@NonNull FragmentActivity activity, int requestId,
                                    @NonNull Class<? extends BaseMwmDialogFragment> dialogClass)
  {
    final FragmentManager fm = activity.getSupportFragmentManager();
    if (fm.isDestroyed())
      return null;

    Fragment f = fm.findFragmentByTag(dialogClass.getName());
    if (f != null)
      return (DialogFragment) f;

    BaseMwmDialogFragment dialog = null;
    try
    {
      dialog = dialogClass.newInstance();
      final Bundle args = new Bundle();
      args.putInt(REQUEST_ID, requestId);
      dialog.setArguments(args);
      dialog.setCancelable(false);
      dialog.show(fm, dialogClass.getName());
    }
    catch (java.lang.InstantiationException e)
    {
      e.printStackTrace();
    }
    catch (IllegalAccessException e)
    {
      e.printStackTrace();
    }


    return dialog;
  }

  @Override
  public void onCreate(@Nullable Bundle savedInstanceState)
  {
    super.onCreate(savedInstanceState);
    Bundle args = getArguments();
    if (args != null)
    {
      mRequestId = args.getInt(REQUEST_ID);
    }
  }

  @Override
  protected int getCustomTheme()
  {
    return super.getFullscreenTheme();
  }

  @NonNull
  @Override
  public Dialog onCreateDialog(Bundle savedInstanceState)
  {
    Dialog res = super.onCreateDialog(savedInstanceState);
    res.requestWindowFeature(Window.FEATURE_NO_TITLE);

    View content = View.inflate(getActivity(), getLayoutRes(), null);
    res.setContentView(content);
    View button = content.findViewById(getFirstActionButton());
    if (button != null)
      button.setOnClickListener(this);
    button = content.findViewById(getContinueActionButton());
    if (button != null)
      button.setOnClickListener(this);

    return res;
  }

  @LayoutRes
  abstract protected int getLayoutRes();

  @IdRes
  protected abstract int getFirstActionButton();

  protected abstract void onFirstActionClick();

  @IdRes
  protected abstract int getContinueActionButton();

  @Override
  public void onClick(@NonNull View v)
  {
    if (v.getId() == getFirstActionButton())
    {
      onFirstActionClick();
      return;
    }

    if (v.getId() == getContinueActionButton())
    {
      PermissionsUtils.requestPermissions(getActivity(), mRequestId);
    }
  }

  protected int getRequestId()
  {
    return mRequestId;
  }
}
