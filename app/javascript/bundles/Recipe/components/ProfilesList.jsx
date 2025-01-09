import React from 'react';
import { useSelector } from 'react-redux';

export const ProfilesList = (profiles, selectedIds = [], onSelect) => {
  const handleClick = (profile) => {
    // handle profile selection logic here
    console.log(`Selected profile: ${profile.nickname}; profile id: ${profile.id}`);

  }

  const profileData = profiles.profiles.profiles
  console.log('in profile selector')
  console.log(profileData);
  console.log(typeof(profileData));
  if (!profiles || profiles.length == 0) {
    return(
    <div>
    You don't have any profiles yet. Please add a profile first.
    </div>
    );}

  return (
    <div className="profile_selector d-flex justify-content-between">
      <p><strong>Who are you cooking for?</strong></p>
      {/* Add your profile selection logic here */}
      {Object.values(profileData).map(profile => (
        <button

        key={profile.id}
        onClick={() => handleClick(profile)}
        className={selectedIds.includes(profile.id) ? 'selected' : ''}
        >
          {profile.nickname}
        </button>
      ))}
    </div>
  );
};
